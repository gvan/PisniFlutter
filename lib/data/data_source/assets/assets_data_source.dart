import 'package:pisni/data/models/songs/category_model.dart';
import 'package:pisni/data/models/songs/category_type.dart';
import 'package:pisni/data/models/songs/song_model.dart';

abstract class AssetsDataSource {
  Future<List<CategoryModel>> getCategories(CategoryType type);
  Future<List<SongModel>> getSongs(String category);
}
