import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Asap',
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w800,
          height: 1.1,
        ),
        titleMedium: TextStyle(
          fontSize: 55,
          fontWeight: FontWeight.w800,
          height: 0.9,
        ),
        titleSmall: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          height: 0.9,
          color: Colors.black87,
        ),
        bodySmall: TextStyle(
          fontSize: 20,
          height: 1.5,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: 'Asap',
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w800,
          height: 1.5,
        ),
        titleMedium: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w800,
          height: 0.9,
        ),
        titleSmall: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          height: 0.9,
          color: Colors.black87,
        ),
        bodySmall: TextStyle(
          fontSize: 20,
          height: 1.5,
        ),
      ),
    );
  }
}
