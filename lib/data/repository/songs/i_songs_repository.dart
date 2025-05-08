import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/song.dart';

abstract class ISongsRepository {
  Stream<List<Category>> listenCategoriesWithSongs();
  Stream<List<Category>> listenAuthorsWithSongs();
  Future<List<Song>> getSongs(String category);
  Future<List<Song>> search(String text);
  Future<bool> isFavoriteSong(int songId);
  Future<void> toggleFavorite(int songId);
  Future<List<Song>> getFavoriteSongs();
}
