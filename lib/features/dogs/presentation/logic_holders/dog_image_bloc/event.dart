import 'package:equatable/equatable.dart';

abstract class DogImageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetDogImage extends DogImageEvent {}