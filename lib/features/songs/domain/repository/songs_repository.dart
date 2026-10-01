import 'package:pisni/features/songs/data/models/category_model.dart';
import 'package:pisni/features/songs/data/models/song_model.dart';

abstract class SongsRepository {
  Stream<List<CategoryModel>> streamCategoriesWithSongs();
  Stream<List<CategoryModel>> streamAuthorsWithSongs();

  Future<List<SongModel>> getSongs(String category);
  Future<List<SongModel>> searchSongs(String text);

  Future<bool> isFavoriteSong(int songId);
  Future<void> toggleFavorite(int songId);
  Stream<List<SongModel>> streamFavoriteSongs();
}
