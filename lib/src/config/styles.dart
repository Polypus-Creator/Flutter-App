import 'package:flutter/material.dart';

class AppStyles {
  static var primaryColor = Color(0xff00ccff);

  static TextTheme textTheme = TextTheme(
    headline1: TextStyle(),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline5: TextStyle(),
    headline6: TextStyle(),
    button: TextStyle(fontWeight: FontWeight.bold),
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
    subtitle1: TextStyle(),
    subtitle2: TextStyle(),
    caption: TextStyle(),
    overline: TextStyle(),
  );

  static ThemeData mainTheme = ThemeData(
    primaryColor: primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: primaryColor,
          textStyle: textTheme.button!.copyWith(fontSize: 18)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primaryColor,
      ),
    ),
  );

  static ThemeData darkTheme = mainTheme.copyWith(
    brightness: Brightness.dark,
  );
}
