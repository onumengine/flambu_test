import 'package:dartz/dartz.dart';
import 'package:flambu_test/features/dogs/domain/entities/dog_breed.dart';
import 'package:flambu_test/features/dogs/domain/repositories/dogs_list_repository.dart';
import 'package:flambu_test/features/dogs/domain/use_cases/get_dog_breeds.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDogsListRepository extends Mock implements DogsListRepository {}

void main() {
  late MockDogsListRepository? dogsListRepository;
  late GetDogBreedsUseCase? useCase;

  final dogBreeds = [
    DogBreedEntity('Pit bull'),
  ];

  setUp(() {
    dogsListRepository = MockDogsListRepository();
    useCase = GetDogBreedsUseCase(dogsListRepository: dogsListRepository!);
  });

  test('UseCase returns a list of dog breeds', () async {
    when(dogsListRepository?.getDogBreeds())
        .thenAnswer((_) async => Right(dogBreeds));

    final result = await useCase?.call();

    expect(result, Right(dogBreeds).value[0]);

    verify(useCase?.dogsListRepository.getDogBreeds());
  });
}
