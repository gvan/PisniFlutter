import 'package:pisni/data/models/settings/settings_model.dart';
import 'package:pisni/domain/repository/settings/settings_repository.dart';
import 'package:pisni/data/data_source/preferences/preferences_data_source.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  final PreferencesDataSource preferencesService;

  SettingsRepositoryImpl({required this.preferencesService});

  @override
  Future<SettingsModel> getSettings() async {
    return await preferencesService.getSettings();
  }

  @override
  void saveSettings(SettingsModel settings) async {
    await preferencesService.saveSettings(settings);
  }
}
