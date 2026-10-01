import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/data/models/settings/settings_model.dart';
import 'package:pisni/domain/entities/settings/settings_entity.dart';
import 'package:pisni/domain/usecase/settings/get_settings_use_case.dart';
import 'package:pisni/domain/usecase/settings/save_settings_use_case.dart';
import 'package:pisni/presentation/screens/settings/cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetSettingsUseCase _getSettingsUseCase;
  final SaveSettingsUseCase _saveSettingsUseCase;

  SettingsCubit({
    required this._getSettingsUseCase,
    required this._saveSettingsUseCase,
  }) : super(SettingsState(settings: null)) {
    loadSettings();
  }

  void loadSettings() async {
    final settings = await _getSettingsUseCase();
    emit(state.copyWith(settings: settings.toEntity()));
  }

  void changeThemeMode(AppThemeMode mode) {
    emit(state.copyWith(settings: state.settings?.copyWith(themeMode: mode)));
    _saveSettingsUseCase(state.settings!.toModel());
  }
}
