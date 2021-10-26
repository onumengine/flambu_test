import 'package:dartz/dartz.dart';
import 'package:flambu_test/core/error/exception.dart';
import 'package:flambu_test/core/error/failure.dart';
import 'package:flambu_test/core/network/network_info.dart';
import 'package:flambu_test/features/dogs/data/data_sources/dog_image_local_data_source.dart';
import 'package:flambu_test/features/dogs/data/data_sources/random_dog_image_remote_data_source.dart';
import 'package:flambu_test/features/dogs/data/models/dog_image_link_model.dart';
import 'package:flambu_test/features/dogs/domain/entities/dog_image_link.dart';
import 'package:flambu_test/features/dogs/domain/repositories/random_dog_image_repository.dart';

class RandomDogImageRepositoryImpl implements RandomDogImageRepository {
  final RandomDogImageRemoteDataSource remoteDataSource;
  final DogImageLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RandomDogImageRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DogImageLinkEntity>> getRandomDogImageLink() async {
    if (await networkInfo.deviceIsConnected) {
      try {
        final DogImageLinkModel remoteDogImageLinkModel = await remoteDataSource.getRandomDogImageLink();
        final bool cachingIsSuccessful = await localDataSource.cacheDogImageLinkModel(remoteDogImageLinkModel);
        return Right(remoteDogImageLinkModel);
      } on ServerException {
        return Left(ServerFailure());
      } on CachingException {
        return Left(CachingFailure());
      }
    } else {
      try {
        final DogImageLinkModel cachedDogImageLinkModel = await localDataSource.getCachedImage();
        return Right(cachedDogImageLinkModel);
      } on CacheReadingException {
        return Left(CacheReadingFailure());
      }
    }
  }
}