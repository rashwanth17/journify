//
//
// import 'package:flutter/material.dart';
//
// import 'package:flutter/material.dart';
//
// ThemeData lightmode = ThemeData(
//     brightness: Brightness.light,
//     colorScheme: ColorScheme.light(
//       background: Colors.grey.shade400,
//       primary: Colors.grey.shade300,
//       secondary: Colors.grey.shade500,
//     ));
//
// ThemeData darkmode = ThemeData(
//     brightness: Brightness.dark,
//     colorScheme: ColorScheme.dark(
//       background: Colors.grey.shade900,
//       primary: Colors.grey.shade800,
//       secondary: Colors.grey.shade700,
//     ));
//
// class ThemeProvider with ChangeNotifier {
//   ThemeData _themeData = lightmode;
//   ThemeData get themeData => _themeData;
//   set themeData(ThemeData themeData) {
//     _themeData = themeData;
//     notifyListeners();
//   }
//
//   void toggleTheme() {
//     if (_themeData == lightmode) {
//       themeData = darkmode;
//     } else {
//       themeData = lightmode;
//     }
//   }
// }

import 'package:flutter/material.dart';

// Light Theme
ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade500,
    background: Colors.grey.shade400,
    surface: Colors.grey.shade100,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.black,
    onSurface: Colors.black,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.grey.shade400,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.teal,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black87),
    displayLarge: TextStyle(color: Colors.black),
    displayMedium: TextStyle(color: Colors.black54),
    titleMedium: TextStyle(color: Colors.black),
    titleSmall: TextStyle(color: Colors.black87),
  ),
);

// Dark Theme
ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    background: Colors.grey.shade900,
    surface: Colors.grey.shade800,
    error: Colors.redAccent,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onBackground: Colors.white,
    onSurface: Colors.white,
    onError: Colors.black,
  ),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    color: Colors.grey.shade900,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.teal,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    displayLarge: TextStyle(color: Colors.white),
    displayMedium: TextStyle(color: Colors.white60),
    titleMedium: TextStyle(color: Colors.white),
    titleSmall: TextStyle(color: Colors.white70),
  ),
);

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightmode;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
  }
}
