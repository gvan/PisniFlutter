import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/data/repository/i_songs_repository.dart';
import 'package:pisni/data/service/i_songs_service.dart';

class SongsRepository implements ISongsRepository {
  SongsRepository({required ISongsService songsService})
      : _songsService = songsService;

  final ISongsService _songsService;

  @override
  Future<List<Category>> getCategories() async {
    final categories = await _songsService.getCategories();
    for (final (index, category) in categories.indexed) {
      final songs = await _songsService.getSongs(category.id);
      categories[index] = category.copyWith(songs: songs);
    }
    return categories;
  }

  @override
  Future<List<Category>> getAuthors() async {
    final authors = await _songsService.getAuthors();
    for (final (index, category) in authors.indexed) {
      final songs = await _songsService.getSongs(category.id);
      authors[index] = category.copyWith(songs: songs);
    }
    return authors;
  }

  @override
  Future<List<Song>> getSongs(String category) {
    return _songsService.getSongs(category);
  }
}
