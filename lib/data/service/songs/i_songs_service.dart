import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/category_type.dart';
import 'package:pisni/data/entity/song.dart';

abstract class ISongsService {
  Future<List<Category>> getCategories(CategoryType type);
  Future<List<Category>> getCategoriesAssets(CategoryType type);
  Future<void> saveCategories(List<Category> categories);
  Future<List<Song>> getSongs(String category);
  Future<List<Song>> getSongsAssets(String category);
  Future<void> saveSongs(List<Song> songs);
}
