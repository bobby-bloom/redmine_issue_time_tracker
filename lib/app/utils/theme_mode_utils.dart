import 'package:flutter/material.dart';
import 'package:ritt/app/theme/app_theme.dart';

extension ThemeModeToAppTheme on ThemeMode {
  ThemeData toAppTheme() {
    switch (this) {
      case ThemeMode.system:
        return AppTheme.lightTheme;
      case ThemeMode.light:
        return AppTheme.lightTheme;
      case ThemeMode.dark:
        return AppTheme.darkTheme;
    }
  }
}
