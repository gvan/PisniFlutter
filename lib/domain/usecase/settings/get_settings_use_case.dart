import 'package:pisni/data/models/settings/settings_model.dart';
import 'package:pisni/domain/repository/settings/settings_repository.dart';

class GetSettingsUseCase {
  final SettingsRepository _settingsRepository;

  GetSettingsUseCase({required this._settingsRepository});

  Future<SettingsModel> call() async {
    return _settingsRepository.getSettings();
  }
}
