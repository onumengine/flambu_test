import 'package:equatable/equatable.dart';

class DogBreedEntity extends Equatable {
  final String name;

  const DogBreedEntity(this.name);

  @override
  List<Object?> get props => [name];
}
