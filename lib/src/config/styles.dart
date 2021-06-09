import 'package:flutter/material.dart';

class AppStyles {
  static var primaryColor = Colors.blue;

  static ThemeData mainTheme = ThemeData(
    primarySwatch: primaryColor,
  );

  static ThemeData darkTheme = mainTheme.copyWith(
    brightness: Brightness.dark,
  );
}
