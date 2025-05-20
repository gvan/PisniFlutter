import 'package:flutter/material.dart';
import 'package:pisni/data/models/settings/settings_model.dart';

extension FlutterThemeMode on AppThemeMode {
  ThemeMode toFlutter() {
    switch (this) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}

extension ThemeStylesBuildContext on BuildContext {

  TextTheme get textStyles => TextTheme.of(this);

}
