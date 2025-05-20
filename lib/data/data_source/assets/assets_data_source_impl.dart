import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pisni/data/models/songs/category_model.dart';
import 'package:pisni/data/models/songs/category_type.dart';
import 'package:pisni/data/models/songs/song_model.dart';
import 'package:pisni/data/data_source/assets/assets_data_source.dart';

class AssetsDataSourceImpl extends AssetsDataSource {
  @override
  Future<List<CategoryModel>> getCategories(CategoryType type) async {
    final fileName = type == CategoryType.category
        ? 'assets/home.json'
        : 'assets/authors.json';
    final data = await rootBundle.loadString(fileName);
    final json = jsonDecode(data);
    return List<CategoryModel>.from(
      json.map(
        (x) => CategoryModel.fromJson(x).copyWith(type: type),
      ),
    );
  }

  @override
  Future<List<SongModel>> getSongs(String category) async {
    final data = await rootBundle.loadString('assets/songs/$category.json');
    final json = jsonDecode(data);
    return List<SongModel>.from(
      json.map(
        (x) => SongModel.fromJson(x).copyWith(category: category),
      ),
    );
  }
}
