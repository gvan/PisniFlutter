import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/category_type.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/data/service/preferences/i_preferences_service.dart';
import 'package:pisni/data/service/songs/i_songs_service.dart';

class SongsRepository implements ISongsRepository {
  SongsRepository(
      {required ISongsService songsService,
      required IPreferencesService preferencesService})
      : _songsService = songsService,
        _preferencesService = preferencesService {
    initDatabase();
  }

  final ISongsService _songsService;
  final IPreferencesService _preferencesService;

  final Map<String, Category> categoriesCache = {};

  void initDatabase() async {
    var categories = await _songsService.getCategories(CategoryType.category);
    if (categories.isEmpty) {
      final categoriesAssets =
          await _songsService.getCategoriesAssets(CategoryType.category);
      await _songsService.saveCategories(categoriesAssets);
    }
    var authors = await _songsService.getCategories(CategoryType.author);
    if (authors.isEmpty) {
      final authorsAssets =
          await _songsService.getCategoriesAssets(CategoryType.author);
      await _songsService.saveCategories(authorsAssets);
    }

    categories = await _songsService.getCategories(CategoryType.category);
    authors = await _songsService.getCategories(CategoryType.author);
    for (final category in [...categories, ...authors]) {
      final songs = await _songsService.getSongs(category.id);
      if (songs.isEmpty) {
        final songsAssets = await _songsService.getSongsAssets(category.id);
        await _songsService.saveSongs(songsAssets);
      }
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    final categories = await _songsService.getCategories(CategoryType.category);
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
    final authors = await _songsService.getCategories(CategoryType.author);
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

  @override
  Future<List<Song>> getFavorites() async {
    final favoriteIds = await _preferencesService.getFavorites();
    if (favoriteIds.isEmpty) {
      return [];
    }
    final List<Song> favoriteSongs = [];
    final categories = await getCategories();
    final authors = await getAuthors();
    for (final category in categories) {
      for (final song in category.songs) {
        if (favoriteIds.contains(song.id.toString())) {
          favoriteSongs.add(song);
        }
      }
    }
    for (final author in authors) {
      for (final song in author.songs) {
        if (favoriteIds.contains(song.id.toString())) {
          favoriteSongs.add(song);
        }
      }
    }
    return favoriteSongs;
  }

  @override
  Future<void> toggleFavorite(int id) async {
    final songId = id.toString();
    final favoriteSongs = await _preferencesService.getFavorites();
    if (favoriteSongs.contains(songId)) {
      await _preferencesService.removeFromFavorite(songId);
    } else {
      await _preferencesService.addToFavorite(songId);
    }
  }

  @override
  Future<bool> isFavoriteSong(int songId) async {
    final favoriteSongs = await _preferencesService.getFavorites();
    return favoriteSongs.contains(songId.toString());
  }
}
