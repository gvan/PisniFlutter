import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/song.dart';

abstract class ISongsRepository {
  Stream<List<Category>> streamCategoriesWithSongs();
  Stream<List<Category>> streamAuthorsWithSongs();

  Future<List<Song>> getSongs(String category);
  Future<List<Song>> searchSongs(String text);

  Future<bool> isFavoriteSong(int songId);
  Future<void> toggleFavorite(int songId);
  Stream<List<Song>> streamFavoriteSongs();
}
