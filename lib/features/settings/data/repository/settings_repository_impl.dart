import 'package:pisni/features/settings/data/models/settings_model.dart';
import 'package:pisni/features/settings/domain/repository/settings_repository.dart';
import 'package:pisni/features/settings/data/data_source/preferences/preferences_data_source.dart';

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
