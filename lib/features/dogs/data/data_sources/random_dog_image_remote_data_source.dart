import 'dart:convert';

import 'package:flambu_test/core/error/exception.dart';
import 'package:flambu_test/features/dogs/data/models/dog_image_link_model.dart';
import 'package:http/http.dart';

abstract class RandomDogImageRemoteDataSource {
  Future<DogImageLinkModel> getRandomDogImageLink();
}

class RandomDogImageRemoteDataSourceImpl implements RandomDogImageRemoteDataSource {
  final Client client;
  
  RandomDogImageRemoteDataSourceImpl({required this.client});
  
  @override
  Future<DogImageLinkModel> getRandomDogImageLink() async {
    try {
      final response = await client.get(
        Uri.parse('https://dog.ceo/api/breeds/image/random')
      );
      return DogImageLinkModel.fromJson(jsonDecode(response.body));
    } on Exception {
      throw ServerException();
    }
  }
}