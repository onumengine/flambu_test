import 'package:equatable/equatable.dart';
import 'package:flambu_test/core/error/failure.dart';
import 'package:flambu_test/features/dogs/domain/entities/dog_breed_list.dart';

abstract class BreedListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Empty extends BreedListState {}

class Loading extends BreedListState {}

class Loaded extends BreedListState {
  final DogBreedListEntity stateObject;

  Loaded({required this.stateObject});

  @override
  List<Object?> get props => [stateObject];
}

class LoadingError extends BreedListState {
}