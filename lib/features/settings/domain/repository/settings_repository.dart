import 'package:pisni/features/settings/data/models/settings_model.dart';

abstract class SettingsRepository {
  Future<SettingsModel> getSettings();
  void saveSettings(SettingsModel settings);
}