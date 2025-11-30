import 'package:feen_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.lightBackground,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: AppColors.mainLight,
    onPrimary: AppColors.lightBackground,
    secondary: AppColors.secondryLight,
    onSecondary: AppColors.onSecondaryLight,
    onSurface: AppColors.primary,
    primaryContainer: AppColors.mainDark,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightBackground,
  ),
);
