import 'package:flambu_test/core/error/exception.dart';
import 'package:flambu_test/core/network/network_info.dart';
import 'package:flambu_test/features/dogs/data/data_sources/breed_list_local_data_source.dart';
import 'package:flambu_test/features/dogs/data/data_sources/breed_list_remote_data_source.dart';
import 'package:flambu_test/features/dogs/data/models/dog_breed_list_model.dart';
import 'package:flambu_test/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flambu_test/features/dogs/domain/entities/dog_breed_list.dart';
import 'package:flambu_test/features/dogs/domain/repositories/dogs_list_repository.dart';

/// I'm adding the impl suffix because this is a test project
///
/// This repository implementation takes in a Networkinfo, a RemoteDataSource
/// and a LocalDataSource...
class DogsListRepositoryImpl implements DogsListRepository {
  final BreedListRemoteDataSource remoteDataSource;
  final BreedListLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const DogsListRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DogBreedListEntity>> getDogBreeds() async {
    if (await networkInfo.deviceIsConnected) {
      try {
        final DogBreedListModel listOfBreeds =
            await remoteDataSource.getBreedList();
        localDataSource.cacheBreedList(listOfBreeds);
        return Right(listOfBreeds);
      } on ServerException {
        return Left(ServerFailure());
      } on CachingException {
        return Left(CachingFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
