import 'package:dartz/dartz.dart';
import 'package:flambu_test/core/error/failure.dart';
import 'package:flambu_test/features/dogs/domain/entities/dog_breed_list.dart';
import 'package:flambu_test/features/dogs/domain/repositories/dogs_list_repository.dart';
import 'package:flambu_test/features/main/domain/use_cases/use_case.dart';

class GetDogBreedsUseCase implements UseCase<DogBreedListEntity> {
  final DogsListRepository dogsListRepository;

  GetDogBreedsUseCase({required this.dogsListRepository});

  @override
  Future<Either<Failure, DogBreedListEntity>> call() {
    return dogsListRepository.getDogBreeds();
  }
}
