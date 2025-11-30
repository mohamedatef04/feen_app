import 'package:feen_app/core/theme/dark_theme.dart';
import 'package:feen_app/core/theme/light_theme.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData getLightTheme() => lightTheme;
  static ThemeData getDarkTheme() => darkTheme;
}
