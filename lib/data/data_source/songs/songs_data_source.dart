import 'package:pisni/data/models/songs/category_model.dart';
import 'package:pisni/data/models/songs/category_type.dart';
import 'package:pisni/data/models/songs/song_model.dart';

abstract class SongsDataSource {
  Future<List<CategoryModel>> getCategories(CategoryType type);
  Stream<List<CategoryModel>> streamCategories(CategoryType type);
  Future<void> saveCategories(List<CategoryModel> categories);

  Future<List<SongModel>> getSongs({
    String? category,
    List<int>? filterIds,
    int? limit,
  });
  Future<List<SongModel>> searchSongs(String query);
  Future<void> saveSongs(List<SongModel> songs);

  Future<void> addFavorite(int id);
  Future<void> removeFavorite(int id);
  Future<List<int>> getFavorites();
  Stream<List<int>> streamFavorites();
}
