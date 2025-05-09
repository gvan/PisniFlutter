import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/category_type.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/data/service/assets/i_assets_service.dart';

class AssetsService extends IAssetsService {
  @override
  Future<List<Category>> getCategories(CategoryType type) async {
    final fileName = type == CategoryType.category
        ? 'assets/home.json'
        : 'assets/authors.json';
    final data = await rootBundle.loadString(fileName);
    final json = jsonDecode(data);
    return List<Category>.from(
      json.map(
        (x) => Category.fromJson(x).copyWith(type: type),
      ),
    );
  }

  @override
  Future<List<Song>> getSongs(String category) async {
    final data = await rootBundle.loadString('assets/songs/$category.json');
    final json = jsonDecode(data);
    return List<Song>.from(
      json.map(
        (x) => Song.fromJson(x).copyWith(category: category),
      ),
    );
  }
}
