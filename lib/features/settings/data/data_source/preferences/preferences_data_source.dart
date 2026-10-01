import 'package:pisni/features/settings/data/models/settings_model.dart';

abstract class PreferencesDataSource {
  Future<void> saveSettings(SettingsModel settings);
  Future<SettingsModel> getSettings();
}