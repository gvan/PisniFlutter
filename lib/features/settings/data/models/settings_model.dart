
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';

@freezed
class SettingsModel with _$SettingsModel {
  @override
  final AppThemeMode themeMode;

  SettingsModel({required this.themeMode});
}

enum AppThemeMode {
  light(mode: 'light'),
  dark(mode: 'dark'),
  system(mode: 'system');

  final String mode;

  const AppThemeMode({required this.mode});

  static AppThemeMode fromValue(String mode) {
    switch(mode) {
      case 'light': return AppThemeMode.light;
      case 'dark': return AppThemeMode.dark;
      case 'system': return AppThemeMode.system;
    }
    return AppThemeMode.system;
  }

}
