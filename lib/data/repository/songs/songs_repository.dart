import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/category_type.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/data/service/songs/i_songs_service.dart';

class SongsRepository implements ISongsRepository {
  SongsRepository({required ISongsService songsService})
      : _songsService = songsService {
    initDatabase();
  }

  final ISongsService _songsService;

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
  Future<void> toggleFavorite(int songId) async {
    final favoriteSongs = await _songsService.getFavorites();
    if (favoriteSongs.contains(songId)) {
      await _songsService.removeFavorite(songId);
    } else {
      await _songsService.addFavorite(songId);
    }
  }

  @override
  Future<bool> isFavoriteSong(int songId) async {
    final favoriteSongs = await _songsService.getFavorites();
    return favoriteSongs.contains(songId);
  }

  @override
  Future<List<Song>> getFavoriteSongs() async {
    final favoriteIds = await _songsService.getFavorites();
    if (favoriteIds.isEmpty) {
      return [];
    }
    return await _songsService.getSongs(filterIds: favoriteIds);
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
