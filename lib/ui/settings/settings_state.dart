import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/entity/settings.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  @override
  final Settings? settings;

  SettingsState({required this.settings});
}