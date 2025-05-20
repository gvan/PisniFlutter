import 'package:pisni/data/models/settings/settings_model.dart';

abstract class ISettingsRepository {
  Future<SettingsModel> getSettings();
  void saveSettings(SettingsModel settings);
}