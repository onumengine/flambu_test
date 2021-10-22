import 'package:dartz/dartz.dart';
import 'package:flambu_test/core/error/failure.dart';
import 'package:flambu_test/features/dogs/domain/entities/dog_breed.dart';

abstract class DogsListRepository {
  Future<Either<Failure, List<DogBreedEntity>>> getDogBreeds();
}
