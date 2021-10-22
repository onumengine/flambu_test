import 'package:dartz/dartz.dart';
import 'package:flambu_test/core/error/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
