import 'package:flutter/material.dart';
import 'package:takse/core/theme/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData getAppTheme() {
    return ThemeData(
      useMaterial3: false,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.deepYellow.withOpacity(0.8),
      ),
    );
  }
}
