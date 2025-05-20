import 'package:flutter/material.dart';
import 'package:pisni/data/repository/settings/i_settings_repository.dart';
import 'package:pisni/presentation/extensions/styles.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeMode? _themeMode;
  final ISettingsRepository _settingsRepository;

  ThemeMode? get themeMode => _themeMode;

  ThemeViewModel({required ISettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository {
    loadTheme();
  }

  void loadTheme() async {
    final settings = await _settingsRepository.getSettings();
    _themeMode = settings.themeMode.toFlutter();
    notifyListeners();
  }
}
