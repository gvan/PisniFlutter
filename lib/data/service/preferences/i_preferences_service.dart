import 'package:pisni/data/entity/settings.dart';

abstract class IPreferencesService {
  Future<void> saveSettings(Settings settings);
  Future<Settings> getSettings();
}