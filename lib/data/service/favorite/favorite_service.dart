import 'package:pisni/data/service/favorite/i_favorite_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService implements IFavoriteService {
  static const _favoriteSongsKey = 'favorite_songs';

  @override
  Future<void> addToFavorite(String songId) async {
    final prefs = SharedPreferencesAsync();
    final favoriteSongs = await prefs.getStringList(_favoriteSongsKey) ?? [];
    favoriteSongs.add(songId);
    await prefs.setStringList(_favoriteSongsKey, favoriteSongs);
  }

  @override
  Future<void> removeFromFavorite(String songId) async {
    final prefs = SharedPreferencesAsync();
    final favoriteSongs = await prefs.getStringList(_favoriteSongsKey) ?? [];
    favoriteSongs.remove(songId);
    await prefs.setStringList(_favoriteSongsKey, favoriteSongs);
  }

  @override
  Future<List<String>> getFavorites() async {
    final prefs = SharedPreferencesAsync();
    final favoriteSongs = await prefs.getStringList(_favoriteSongsKey) ?? [];
    return favoriteSongs;
  }
}
