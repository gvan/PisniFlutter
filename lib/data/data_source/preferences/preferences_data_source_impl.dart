import 'package:pisni/data/models/settings/settings_model.dart';
import 'package:pisni/data/data_source/preferences/preferences_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesDataSourceImpl implements PreferencesDataSource {
  static const _themeModeKey = 'theme_mode';

  @override
  Future<SettingsModel> getSettings() async {
    final prefs = SharedPreferencesAsync();
    final themeMode = await prefs.getString(_themeModeKey) ?? '';
    final settings = SettingsModel(themeMode: AppThemeMode.fromValue(themeMode));
    return settings;
  }

  @override
  Future<void> saveSettings(SettingsModel settings) async {
    final prefs = SharedPreferencesAsync();
    await prefs.setString(_themeModeKey, settings.themeMode.mode);
  }
}
