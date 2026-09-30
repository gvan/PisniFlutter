import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/data/repository/settings/settings_repository.dart';
import 'package:pisni/presentation/extensions/styles.dart';

class ThemeCubit extends Cubit<ThemeMode?> {
  final SettingsRepository _settingsRepository;

  ThemeCubit({required this._settingsRepository}) : super(null) {
    loadTheme();
  }

  void loadTheme() async {
    final settings = await _settingsRepository.getSettings();
    emit(settings.themeMode.toFlutter());
  }
}
