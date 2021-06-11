import 'package:flutter/material.dart';

class AppStyles {
  static var primaryColor = Color(0xff00ccff);

  static TextTheme textTheme = TextTheme(
    headline1: TextStyle(),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline5: TextStyle(
      fontSize: 22,
    ),
    headline6: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    button: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
    subtitle1: TextStyle(),
    subtitle2: TextStyle(),
    caption: TextStyle(),
    overline: TextStyle(),
  );

  static ThemeData mainTheme = ThemeData(
    primaryColor: primaryColor,
    textTheme: textTheme,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: Colors.grey[400]!),
          borderRadius: BorderRadius.circular(10)),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        textStyle: textTheme.button,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primaryColor,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor:
          MaterialStateProperty.resolveWith<Color>((states) => primaryColor),
    ),
    cardTheme: CardTheme(
      elevation: 2,
    ),
  );

  static ThemeData darkTheme = mainTheme.copyWith(
    brightness: Brightness.dark,
  );
}
