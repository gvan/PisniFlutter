import 'package:pisni/data/entity/settings.dart';

abstract class PreferencesDataSource {
  Future<void> saveSettings(Settings settings);
  Future<Settings> getSettings();
}