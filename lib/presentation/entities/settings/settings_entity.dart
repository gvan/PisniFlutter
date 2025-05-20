import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/models/settings/settings_model.dart';

part 'settings_entity.freezed.dart';

@freezed
class SettingsEntity with _$SettingsEntity {
  @override
  final AppThemeMode themeMode;

  SettingsEntity({required this.themeMode});
}

extension SettingsModelX on SettingsModel {
  SettingsEntity toEntity() => SettingsEntity(themeMode: themeMode);
}

extension SettingsEntityX on SettingsEntity {
  SettingsModel toModel() => SettingsModel(themeMode: themeMode);
}
