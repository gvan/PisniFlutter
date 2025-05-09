import 'package:pisni/data/entity/settings.dart';
import 'package:pisni/data/service/preferences/i_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService implements IPreferencesService {
  static const _themeModeKey = 'theme_mode';

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
