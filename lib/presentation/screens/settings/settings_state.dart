import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/models/settings/settings_model.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  @override
  final SettingsModel? settings;

  SettingsState({required this.settings});
}