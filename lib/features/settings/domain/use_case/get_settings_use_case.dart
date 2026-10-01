import 'package:pisni/features/settings/data/models/settings_model.dart';
import 'package:pisni/features/settings/domain/repository/settings_repository.dart';

class GetSettingsUseCase {
  final SettingsRepository _settingsRepository;

  GetSettingsUseCase({required this._settingsRepository});

  Future<SettingsModel> call() async {
    return _settingsRepository.getSettings();
  }
}
