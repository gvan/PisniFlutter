import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/data/repository/i_songs_repository.dart';
import 'package:pisni/data/service/i_songs_service.dart';

class SongsRepository implements ISongsRepository {
  SongsRepository({required ISongsService songsService})
      : _songsService = songsService;

  final ISongsService _songsService;

  final Map<String, Category> categoriesCache = {};

  @override
  Future<List<Category>> getCategories() async {
    final categories = await _songsService.getCategories();
    for (final (index, category) in categories.indexed) {
      if (categoriesCache[category.id] == null) {
        final songs = await _songsService.getSongs(category.id);
        categoriesCache[category.id] = category.copyWith(songs: songs);
      }
      categories[index] = categoriesCache[category.id]!;
    }
    return categories;
  }

  @override
  Future<List<Category>> getAuthors() async {
    final authors = await _songsService.getAuthors();
    for (final (index, category) in authors.indexed) {
      if (categoriesCache[category.id] == null) {
        final songs = await _songsService.getSongs(category.id);
        categoriesCache[category.id] = category.copyWith(songs: songs);
      }
      authors[index] = categoriesCache[category.id]!;
    }
    return authors;
  }

  @override
  Future<List<Song>> getSongs(String category) {
    return _songsService.getSongs(category);
  }

  @override
  Future<List<Song>> search(String text) async {
    if (text.length < 3) {
      return [];
    }
    final categories = await getCategories();
    final authors = await getAuthors();
    final List<Song> songs = [];
    for (final category in categories) {
      for (final song in category.songs) {
        if (song.title.toLowerCase().contains(text.toLowerCase()) ||
            song.text.toLowerCase().contains(text.toLowerCase())) {
          songs.add(song);
        }
      }
    }
    for (final author in authors) {
      for (final song in author.songs) {
        if (song.title.toLowerCase().contains(text.toLowerCase()) ||
            song.text.toLowerCase().contains(text.toLowerCase())) {
          songs.add(song);
        }
      }
    }
    return songs;
  }
}
