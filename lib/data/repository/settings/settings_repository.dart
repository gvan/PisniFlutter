import 'package:pisni/data/entity/settings.dart';
import 'package:pisni/data/repository/settings/i_settings_repository.dart';
import 'package:pisni/data/data_source/preferences/preferences_data_source.dart';

class SettignsRepository extends ISettingsRepository {
  final PreferencesDataSource preferencesService;

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
