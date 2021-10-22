import 'dart:convert';

import 'package:flambu_test/core/error/exception.dart';
import 'package:flambu_test/features/dogs/data/models/dog_breed_list_model.dart';
import 'package:http/http.dart';

abstract class BreedListRemoteDataSource {
  Future<DogBreedListModel> getBreedList();
}

class BreedListRemoteDataSourceImpl implements BreedListRemoteDataSource {
  final Client client;

  BreedListRemoteDataSourceImpl({required this.client});

  @override
  Future<DogBreedListModel> getBreedList() async {
    final response = await client.get(
      Uri.parse('https://dog.ceo/api/breeds/list/all'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return DogBreedListModel.fromJson(jsonDecode(response.body)['message']);
    } else {
      throw ServerException();
    }
  }
}
