import 'package:pisni/data/entity/settings.dart';
import 'package:pisni/data/repository/settings/i_settings_repository.dart';
import 'package:pisni/data/service/preferences/i_preferences_service.dart';

class SettignsRepository extends ISettingsRepository {
  final IPreferencesService preferencesService;

  SettignsRepository({required this.preferencesService});

  @override
  Future<Settings> getSettings() async {
    return await preferencesService.getSettings();
  }

  @override
  void saveSettings(Settings settings) async {
    await preferencesService.saveSettings(settings);
  }
}
