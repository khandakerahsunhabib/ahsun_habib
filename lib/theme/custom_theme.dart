import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Asap',
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.w800,
          height: 0.9,
        ),
        titleSmall: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          height: 0.9,
          color: Colors.black54,
        ),
        bodySmall: TextStyle(
          fontSize: 21,
          height: 1.7,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }
}
