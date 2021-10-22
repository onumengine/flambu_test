import 'package:equatable/equatable.dart';

class DogBreed extends Equatable {
  final String name;

  const DogBreed(this.name);

  @override
  List<Object?> get props => [name];
}
