import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/features/settings/domain/entities/settings_entity.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  @override
  final SettingsEntity? settings;

  SettingsState({required this.settings});
}