import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/service/i_songs_service.dart';

class SongsService implements ISongsService {
  @override
  Future<List<Category>> getCategories() async {
    final data = await rootBundle.loadString('assets/home.json');
    final json = jsonDecode(data);
    return List<Category>.from(json.map((x) => Category.fromJson(x)));
  }

  @override
  Future<List<Category>> getAuthors() async {
    final data = await rootBundle.loadString('assets/authors.json');
    final json = jsonDecode(data);
    return List<Category>.from(json.map((x) => Category.fromJson(x)));
  }
}
