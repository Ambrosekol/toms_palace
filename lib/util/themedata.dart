import 'package:flutter/material.dart';

ThemeData appThemeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xFF736557),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF736557),
    onPrimary: Colors.white,
    secondary: Color(0xFFfaf2e9),
    onSecondary: Color(0xFFa09182),
    error: Color(0xFFf1ece1),
    onError: Colors.black,
    background: Colors.white,
    onBackground: Color(0xFF736557),
    surface: Color(0xFFfbf7f3),
    onSurface: Color(0xFF736557),
  ),
  textTheme: appTextTheme,
  elevatedButtonTheme: appElevatedButtonTheme,
);

TextTheme appTextTheme = const TextTheme().copyWith(
  bodyLarge: const TextStyle(
    color: Color(0xFF736557),
    fontFamily: "Ubuntu",
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
  bodyMedium: const TextStyle(
    color: Color(0xFF736557),
    fontFamily: "Ubuntu",
    fontSize: 14.0,
  ),
);

ElevatedButtonThemeData appElevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    textStyle: MaterialStateProperty.resolveWith(
      (states) => const TextStyle(
        color: Colors.white,
        fontFamily: 'Hind',
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
    ),
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) => const Color(0xFF736557),
    ),
    fixedSize:
        MaterialStateProperty.resolveWith((states) => const Size(150, 40)),
    shadowColor: MaterialStateProperty.resolveWith((states) => Colors.black),
    elevation: MaterialStateProperty.resolveWith((states) => 15.0),
  ),
);
