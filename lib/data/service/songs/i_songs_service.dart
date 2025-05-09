import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/category_type.dart';
import 'package:pisni/data/entity/song.dart';

abstract class ISongsService {
  Future<List<Category>> getCategories(CategoryType type);
  Stream<List<Category>> streamCategories(CategoryType type);
  Future<void> saveCategories(List<Category> categories);

  Future<List<Song>> getSongs({
    String? category,
    List<int>? filterIds,
    int? limit,
  });
  Future<List<Song>> searchSongs(String query);
  Future<void> saveSongs(List<Song> songs);

  Future<void> addFavorite(int id);
  Future<void> removeFavorite(int id);
  Future<List<int>> getFavorites();
  Stream<List<int>> streamFavorites();
}
