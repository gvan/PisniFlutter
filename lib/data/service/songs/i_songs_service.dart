import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/category_type.dart';
import 'package:pisni/data/entity/song.dart';

abstract class ISongsService {
  Future<List<Category>> getCategories(CategoryType type);
  Stream<List<Category>> listenCategories(CategoryType type);
  Future<List<Category>> getCategoriesAssets(CategoryType type);
  Future<void> saveCategories(List<Category> categories);
  Future<List<Song>> getSongs({
    String? category,
    List<int>? filterIds,
    int? limit,
  });
  Future<List<Song>> searchSongs(String query);
  Future<List<Song>> getSongsAssets(String category);
  Future<void> saveSongs(List<Song> songs);
}
