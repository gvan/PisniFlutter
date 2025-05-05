import 'package:pisni/data/entity/settings.dart';
import 'package:pisni/data/service/preferences/i_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService implements IPreferencesService {
  static const _favoriteSongsKey = 'favorite_songs';

  static const _themeModeKey = 'theme_mode';

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

  @override
  Future<Settings> getSettings() async {
    final prefs = SharedPreferencesAsync();
    final themeMode = await prefs.getString(_themeModeKey) ?? '';
    final settings = Settings(themeMode: AppThemeMode.fromValue(themeMode));
    return settings;
  }

  @override
  Future<void> saveSettings(Settings settings) async {
    final prefs = SharedPreferencesAsync();
    await prefs.setString(_themeModeKey, settings.themeMode.mode);
  }
}
