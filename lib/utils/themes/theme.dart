import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppThemes {
  AppThemes._();

  // =========================== LIGHT THEME =============================

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Inter',
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
  );
}
