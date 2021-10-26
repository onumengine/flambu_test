import 'package:equatable/equatable.dart';
import 'package:flambu_test/features/dogs/domain/entities/dog_image_link.dart';

abstract class DogImageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmptyImage extends DogImageState {}

class LoadingImage extends DogImageState {}

class LoadedImage extends DogImageState {
  final DogImageLinkEntity stateObject;

  LoadedImage({required this.stateObject});
}

class ErrorLoadingImage extends DogImageState {}