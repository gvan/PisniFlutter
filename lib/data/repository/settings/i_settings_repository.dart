import 'package:pisni/data/entity/settings.dart';

abstract class ISettingsRepository {
  Future<Settings> getSettings();
  void saveSettings(Settings settings);
}