
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
class Settings with _$Settings {
  @override
  final AppThemeMode themeMode;

  Settings({required this.themeMode});
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
