import 'package:flambu_test/features/dogs/domain/entities/dog_image_link.dart';

class DogImageLinkModel extends DogImageLinkEntity {
  const DogImageLinkModel(String imageLink) : super(imageLink);

  factory DogImageLinkModel.fromJson(Map<String, dynamic> dogObject) {
    return DogImageLinkModel(dogObject['message']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'link': '$imageLink',
    };
  }
}
