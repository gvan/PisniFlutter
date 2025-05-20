import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/presentation/entities/settings/settings_entity.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  @override
  final SettingsEntity? settings;

  SettingsState({required this.settings});
}