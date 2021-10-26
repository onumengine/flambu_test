import 'package:equatable/equatable.dart';

abstract class BreedListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Empty extends BreedListState {}

class Loading extends BreedListState {}

class Loaded extends BreedListState {
  final List<String> listOfBreeds;

  Loaded({required this.listOfBreeds});

  @override
  List<Object?> get props => [listOfBreeds];
}

class LoadingError extends BreedListState {
  final String errorMessage;

  LoadingError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}