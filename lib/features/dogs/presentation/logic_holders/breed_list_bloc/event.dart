import 'package:equatable/equatable.dart';

abstract class BreedListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetBreedList extends BreedListEvent {}

class GetRandomDogImageLink extends BreedListEvent {}