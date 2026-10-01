import 'package:pisni/data/models/settings/settings_model.dart';
import 'package:pisni/domain/repository/settings/settings_repository.dart';

class SaveSettingsUseCase {
  final SettingsRepository _settingsRepository;

  SaveSettingsUseCase({required this._settingsRepository});

  void call(SettingsModel settingsModel) {
    _settingsRepository.saveSettings(settingsModel);
  }
}
