import 'package:pisni/features/settings/data/models/settings_model.dart';
import 'package:pisni/features/settings/domain/repository/settings_repository.dart';

class SaveSettingsUseCase {
  final SettingsRepository _settingsRepository;

  SaveSettingsUseCase({required this._settingsRepository});

  void call(SettingsModel settingsModel) {
    _settingsRepository.saveSettings(settingsModel);
  }
}
