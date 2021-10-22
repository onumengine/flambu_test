import 'package:dartz/dartz.dart';
import 'package:flambu_test/core/error/failure.dart';

abstract class RandomDogImageRepository {
  Future<Either<Failure, String>> getRandomDogImageLink();
}
