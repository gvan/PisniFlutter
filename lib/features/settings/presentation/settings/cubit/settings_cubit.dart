import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/features/settings/data/models/settings_model.dart';
import 'package:pisni/features/settings/domain/entities/settings_entity.dart';
import 'package:pisni/features/settings/domain/use_case/get_settings_use_case.dart';
import 'package:pisni/features/settings/domain/use_case/save_settings_use_case.dart';
import 'package:pisni/features/settings/presentation/settings/cubit/settings_state.dart';

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
