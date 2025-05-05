import 'package:pisni/data/entity/settings.dart';

abstract class IPreferencesService {
  Future<void> addToFavorite(String songId);
  Future<void> removeFromFavorite(String songId);
  Future<List<String>> getFavorites();

  Future<void> saveSettings(Settings settings);
  Future<Settings> getSettings();
}