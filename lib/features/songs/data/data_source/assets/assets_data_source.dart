import 'package:pisni/features/songs/data/models/category_model.dart';
import 'package:pisni/features/songs/data/models/category_type.dart';
import 'package:pisni/features/songs/data/models/song_model.dart';

abstract class AssetsDataSource {
  Future<List<CategoryModel>> getCategories(CategoryType type);
  Future<List<SongModel>> getSongs(String category);
}
