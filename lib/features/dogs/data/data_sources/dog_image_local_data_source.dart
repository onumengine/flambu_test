import 'dart:convert';

import 'package:flambu_test/core/error/exception.dart';
import 'package:flambu_test/features/dogs/data/models/dog_image_link_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedImageLink = 'cachedImageLink';

abstract class DogImageLocalDataSource {
  Future<DogImageLinkModel> getCachedImage();
  Future<bool> cacheDogImageLinkModel(DogImageLinkModel model);
}

class DogImageLocalDataSourceImpl implements DogImageLocalDataSource {
  final SharedPreferences preferences;

  DogImageLocalDataSourceImpl({required this.preferences});

  @override
  Future<DogImageLinkModel> getCachedImage() async {
    try {
      final result = await preferences.getString(cachedImageLink);
      return DogImageLinkModel(result!);
    } on Exception {
      throw CacheReadingException();
    }
  }

  @override
  Future<bool> cacheDogImageLinkModel(DogImageLinkModel model) async {
    try {
      final bool result = await preferences.setString(cachedImageLink, jsonEncode(model.toJson()),);
      if (!result) {
        throw CachingException();
      }
      return result;
    } on Exception {
      throw CachingException();
    }
  }
}