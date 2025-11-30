import 'package:feen_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.mainDark,
    onPrimary: AppColors.darkBackground,
    secondary: AppColors.secondryDark,
    onSecondary: AppColors.onSecondaryDark,
    onSurface: AppColors.white,
    primaryContainer: AppColors.mainLight,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkBackground,
  ),
);
