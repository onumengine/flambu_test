import 'dart:convert';

import 'package:flambu_test/core/error/exception.dart';
import 'package:flambu_test/features/dogs/data/models/dog_breed_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedBreedList = 'cachedBreedList';

abstract class BreedListLocalDataSource {
  Future<DogBreedListModel> getCachedBreedList();
  Future<bool> cacheBreedList(DogBreedListModel breedListModel);
}

class BreedListLocalDataSourceImpl implements BreedListLocalDataSource {
  final SharedPreferences sharedPreferences;

  BreedListLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<DogBreedListModel> getCachedBreedList() {
    final breedListJson = sharedPreferences.getStringList(cachedBreedList);
    return Future.value(
      DogBreedListModel.fromJson(
        jsonDecode(
          breedListJson!.toString(),
        ),
      ),
    );
  }

  @override
  Future<bool> cacheBreedList(DogBreedListModel breedListModel) {
    try {
      final result = sharedPreferences.setStringList(
          cachedBreedList, breedListModel.breedNames);
      return result;
    } on Exception {
      throw CachingException();
    }
  }
}
