import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/data/models/settings/settings_model.dart';
import 'package:pisni/data/repository/settings/settings_repository.dart';
import 'package:pisni/presentation/entities/settings/settings_entity.dart';
import 'package:pisni/presentation/screens/settings/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _settingsRepository;

  SettingsCubit({required this._settingsRepository})
    : super(SettingsState(settings: null)) {
    loadSettings();
  }

  void loadSettings() async {
    final settings = await _settingsRepository.getSettings();
    emit(state.copyWith(settings: settings.toEntity()));
  }

  void changeThemeMode(AppThemeMode mode) {
    emit(state.copyWith(settings: state.settings?.copyWith(themeMode: mode)));
    _settingsRepository.saveSettings(state.settings!.toModel());
  }
}
