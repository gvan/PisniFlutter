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

  void initDatabase() async {
    var categories = await _songsService.getCategories(CategoryType.category);
    if (categories.isEmpty) {
      final categoriesAssets =
          await _songsService.getCategoriesAssets(CategoryType.category);
      for (final category in categoriesAssets) {
        final songs = await _songsService.getSongs(category: category.id);
        if (songs.isEmpty) {
          final songsAssets = await _songsService.getSongsAssets(category.id);
          await _songsService.saveSongs(songsAssets);
        }
      }
      await _songsService.saveCategories(categoriesAssets);
    }

    var authors = await _songsService.getCategories(CategoryType.author);
    if (authors.isEmpty) {
      final authorsAssets =
          await _songsService.getCategoriesAssets(CategoryType.author);
      for (final category in authorsAssets) {
        final songs = await _songsService.getSongs(category: category.id);
        if (songs.isEmpty) {
          final songsAssets = await _songsService.getSongsAssets(category.id);
          await _songsService.saveSongs(songsAssets);
        }
      }
      await _songsService.saveCategories(authorsAssets);
    }
  }

  @override
  Stream<List<Category>> listenCategoriesWithSongs() =>
      _listenCategoriesWithSongs(CategoryType.category);

  @override
  Stream<List<Category>> listenAuthorsWithSongs() =>
      _listenCategoriesWithSongs(CategoryType.author);

  @override
  Future<List<Song>> getSongs(String category) {
    return _songsService.getSongs(category: category);
  }

  @override
  Future<List<Song>> search(String text) async {
    if (text.length < 3) {
      return [];
    }
    return await _songsService.searchSongs(text);
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

  @override
  Future<List<Song>> getFavoriteSongs() async {
    final favoriteIds = await _preferencesService.getFavorites();
    if (favoriteIds.isEmpty) {
      return [];
    }
    final ids = favoriteIds.map(int.parse).toList();
    return await _songsService.getSongs(filterIds: ids);
  }

  Stream<List<Category>> _listenCategoriesWithSongs(CategoryType type) {
    return _songsService.listenCategories(type).asyncMap((e) async {
      for (final (i, category) in e.indexed) {
        final songs =
            await _songsService.getSongs(category: category.id, limit: 20);
        e[i] = category.copyWith(songs: songs);
      }
      return e;
    });
  }
}
