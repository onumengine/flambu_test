import 'package:equatable/equatable.dart';

class DogBreedListEntity extends Equatable {
  final List<String> breedNames;

  const DogBreedListEntity(this.breedNames);

  @override
  List<Object?> get props => [this.breedNames];
}
