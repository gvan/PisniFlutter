import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/song.dart';

abstract class ISongsRepository {
  Future<List<Category>> getCategories();
  Future<List<Category>> getAuthors();
  Future<List<Song>> getSongs(String category);
  Future<List<Song>> search(String text);
  Future<bool> isFavoriteSong(int songId);
  Future<void> toggleFavorite(int songId);
  Future<List<Song>> getFavorites();
}
