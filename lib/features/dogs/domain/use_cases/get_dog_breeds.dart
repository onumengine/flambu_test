import 'package:dartz/dartz.dart';
import 'package:flambu_test/core/error/failure.dart';
import 'package:flambu_test/features/dogs/domain/entities/dog_breed.dart';
import 'package:flambu_test/features/dogs/domain/repositories/dogs_list_repository.dart';
import 'package:flambu_test/features/main/domain/use_cases/use_case.dart';

class GetDogBreedsUseCase implements UseCase<List<DogBreedEntity>> {
  final DogsListRepository dogsListRepository;

  GetDogBreedsUseCase({required this.dogsListRepository});

  @override
  Future<Either<Failure, List<DogBreedEntity>>> call() async {
    return await dogsListRepository.getDogBreeds();
  }
}
