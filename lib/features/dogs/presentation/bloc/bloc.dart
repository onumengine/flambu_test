import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flambu_test/core/error/failure.dart';
import 'package:flambu_test/features/dogs/domain/entities/dog_breed_list.dart';
import 'package:flambu_test/features/dogs/domain/use_cases/get_dog_breeds.dart';
import 'package:flambu_test/features/dogs/domain/use_cases/get_random_dog_image.dart';
import 'package:flambu_test/features/dogs/presentation/bloc/event.dart';
import 'package:flambu_test/features/dogs/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const SERVER_FAILURE_MESSAGE = 'There has been a server failure';
const CACHING_FAILURE_MESSAGE = 'Caching failed';
const CACHE_READING_FAILURE_MESSAGE = 'Reading from cache failed';

class BreedListBloc extends Bloc<BreedListEvent, BreedListState> {
  final GetDogBreedsUseCase getDogBreeds;
  final GetRandomDogImageUseCase getRandomDogImage;

  BreedListBloc({
    required this.getDogBreeds,
    required this.getRandomDogImage,
  })  : super(Empty()) {
    on<GetBreedList>((event, emit) async {
      emit(Loading());
      final Either<Failure, DogBreedListEntity> result = await getBreedList();
      emit(_getStateFromResult(result));
    });
    on<GetRandomDogImageLink>((event, emit) => Empty());
    /*
    Timer(const Duration(milliseconds: 300), () {
      add(GetBreedList());
    });
     */
  }

  /// What I need is a method that calls the use case and if it returns an error,
  /// it returns an ErrorState but if successful, it returns a Loaded state

  Future<Either<Failure, DogBreedListEntity>> getBreedList() async {
    final Either<Failure, DogBreedListEntity> result = await getDogBreeds();
    return result;
  }

  BreedListState _getStateFromResult(dynamic result) {
    switch (result.runtimeType) {
      case Failure:
        return LoadingError(errorMessage: _mapFailureToMessage(result));
      case DogBreedListEntity:
        return Loaded(listOfBreeds: result.breedNames);
      default:
        return Empty();
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CachingFailure:
        return CACHING_FAILURE_MESSAGE;
      case CacheReadingFailure:
        return CACHE_READING_FAILURE_MESSAGE;
      default:
        return 'Unknown failure';
    }
  }
}
