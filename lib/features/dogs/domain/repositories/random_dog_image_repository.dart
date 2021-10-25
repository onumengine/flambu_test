import 'package:dartz/dartz.dart';
import 'package:flambu_test/core/error/failure.dart';
import 'package:flambu_test/features/dogs/domain/entities/dog_image_link.dart';

abstract class RandomDogImageRepository {
  Future<Either<Failure, DogImageLinkEntity>> getRandomDogImageLink();
}
