import 'package:flambu_test/features/dogs/domain/entities/dog_breed_list.dart';

class DogBreedListModel extends DogBreedListEntity {
  final List<String> dogBreeds;

  const DogBreedListModel(this.dogBreeds) : super(dogBreeds);

  factory DogBreedListModel.fromJson(Map<String, dynamic> listObject) {
    return DogBreedListModel(listObject.keys.toList());
  }
}
