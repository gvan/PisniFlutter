import 'package:pisni/data/models/settings/settings_model.dart';

abstract class PreferencesDataSource {
  Future<void> saveSettings(SettingsModel settings);
  Future<SettingsModel> getSettings();
}