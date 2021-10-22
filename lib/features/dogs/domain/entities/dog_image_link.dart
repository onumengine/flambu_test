import 'package:equatable/equatable.dart';

class DogImageLinkEntity extends Equatable {
  final String imageLink;

  const DogImageLinkEntity(this.imageLink);

  @override
  List<Object?> get props => [imageLink];
}
