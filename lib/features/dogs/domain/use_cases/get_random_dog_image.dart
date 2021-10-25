import 'package:flambu_test/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flambu_test/features/dogs/domain/entities/dog_image_link.dart';
import 'package:flambu_test/features/dogs/domain/repositories/random_dog_image_repository.dart';
import 'package:flambu_test/features/main/domain/use_cases/use_case.dart';

class GetRandomDogImageUseCase implements UseCase<DogImageLinkEntity> {
  final RandomDogImageRepository randomDogImageRepository;

  GetRandomDogImageUseCase({required this.randomDogImageRepository});

  @override
  Future<Either<Failure, DogImageLinkEntity>> call() async {
    return await randomDogImageRepository.getRandomDogImageLink();
  }
}
