import 'package:flutter/material.dart';
import 'package:pisni/data/entity/settings.dart';
import 'package:pisni/data/repository/settings/i_settings_repository.dart';
import 'package:pisni/presentation/screens/settings/settings_state.dart';

class SettingsViewModel extends ChangeNotifier {
  final ISettingsRepository _settingsRepository;
  SettingsState _state = SettingsState(settings: null);

  SettingsState get state => _state;

  SettingsViewModel({required ISettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository {
    loadSettings();
  }

  void loadSettings() async {
    final settings = await _settingsRepository.getSettings();
    _state = _state.copyWith(settings: settings);
    notifyListeners();
  }

  void changeThemeMode(AppThemeMode mode) {
    _state =
        _state.copyWith(settings: _state.settings?.copyWith(themeMode: mode));
    _settingsRepository.saveSettings(_state.settings!);
    notifyListeners();
  }
}
