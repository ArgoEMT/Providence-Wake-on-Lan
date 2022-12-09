import 'package:flutter/material.dart';

class AppTheme {
  static const background = Color(0xff22212C);
  static const comment = Color(0xff282A36);
  static const cyan = Color(0xff80FFEA);

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: background,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: selection,
      contentTextStyle: TextStyle(color: foreground),
    ),
    errorColor: red,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    dialogBackgroundColor: selection,
    colorScheme: const ColorScheme(
      background: background,
      brightness: Brightness.dark,
      primary: purple,
      onPrimary: foreground,
      secondary: pink,
      onSecondary: background,
      error: red,
      onError: background,
      onBackground: foreground,
      surface: selection,
      onSurface: foreground,
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: foreground,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: selection,
      contentTextStyle: TextStyle(color: foreground),
    ),
    errorColor: red,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    dialogBackgroundColor: foreground,
    colorScheme: const ColorScheme(
      background: foreground,
      brightness: Brightness.light,
      primary: purple,
      onPrimary: foreground,
      secondary: pink,
      onSecondary: foreground,
      error: red,
      onError: foreground,
      onBackground: background,
      surface: selection,
      onSurface: background,
    ),
  );

  static const foreground = Color(0xffF8F8F2);
  static const green = Color(0xff8AFF80);
  static const orange = Color(0xffFFCA80);
  static const pink = Color(0xffFF80BF);
  static const purple = Color(0xff9580FF);
  static const red = Color(0xffFF9580);
  static const selection = Color(0xff454158);
  static const yellow = Color(0xffFFFF80);
}
