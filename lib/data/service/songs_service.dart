import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/song.dart';
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

  @override
  Future<List<Song>> getSongs(String category) async {
    final data = await rootBundle.loadString('assets/$category.json');
    final json = jsonDecode(data);
    return List<Song>.from(json.map((x) => Song.fromJson(x)));
  }
}
