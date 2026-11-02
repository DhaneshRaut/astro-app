import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const String defaultFontFamily = 'Geist';

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    fontFamily: defaultFontFamily,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.accentTeal,
      brightness: Brightness.light,
    ),
  );
}
