import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/category_type.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/data/data_source/assets/assets_data_source.dart';
import 'package:pisni/data/data_source/songs/songs_data_source.dart';

class SongsRepository implements ISongsRepository {
  SongsRepository(
      {required SongsDataSource songsService,
      required AssetsDataSource assetsService})
      : _songsService = songsService,
        _assetsService = assetsService {
    initDatabase();
  }

  final SongsDataSource _songsService;
  final AssetsDataSource _assetsService;

  void initDatabase() async {
    var categories = await _songsService.getCategories(CategoryType.category);
    if (categories.isEmpty) {
      final categoriesAssets =
          await _assetsService.getCategories(CategoryType.category);
      for (final category in categoriesAssets) {
        final songs = await _songsService.getSongs(category: category.id);
        if (songs.isEmpty) {
          final songsAssets = await _assetsService.getSongs(category.id);
          await _songsService.saveSongs(songsAssets);
        }
      }
      await _songsService.saveCategories(categoriesAssets);
    }

    var authors = await _songsService.getCategories(CategoryType.author);
    if (authors.isEmpty) {
      final authorsAssets =
          await _assetsService.getCategories(CategoryType.author);
      for (final category in authorsAssets) {
        final songs = await _songsService.getSongs(category: category.id);
        if (songs.isEmpty) {
          final songsAssets = await _assetsService.getSongs(category.id);
          await _songsService.saveSongs(songsAssets);
        }
      }
      await _songsService.saveCategories(authorsAssets);
    }
  }

  @override
  Stream<List<Category>> streamCategoriesWithSongs() =>
      _listenCategoriesWithSongs(CategoryType.category);

  @override
  Stream<List<Category>> streamAuthorsWithSongs() =>
      _listenCategoriesWithSongs(CategoryType.author);

  @override
  Future<List<Song>> getSongs(String category) {
    return _songsService.getSongs(category: category);
  }

  @override
  Future<List<Song>> searchSongs(String text) async {
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
  Stream<List<Song>> streamFavoriteSongs() {
    return _songsService.streamFavorites().asyncMap((e) async {
      return await _songsService.getSongs(filterIds: e);
    });
  }

  Stream<List<Category>> _listenCategoriesWithSongs(CategoryType type) {
    return _songsService.streamCategories(type).asyncMap((e) async {
      for (final (i, category) in e.indexed) {
        final songs =
            await _songsService.getSongs(category: category.id, limit: 20);
        e[i] = category.copyWith(songs: songs);
      }
      return e;
    });
  }
}
