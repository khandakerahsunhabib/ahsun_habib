import 'package:ahsun_habib/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Asap',
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.accentTeal,
        primary: AppColors.accentTeal,
        surface: AppColors.cardLight,
      ),
      textTheme: const TextTheme(
        // Section Headings (Hero, My Skills, Recent Projects)
        titleLarge: TextStyle(
          fontSize: 52,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
          color: AppColors.textDark,
          height: 1.15,
        ),
        // Sub-headings (e.g. Card Titles, Section Subtitles)
        titleMedium: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.textDark,
          height: 1.25,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.textDark,
          height: 1.3,
        ),
        // Body copy
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.textSlate,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textSlate,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSlate,
          height: 1.5,
        ),
      ),
    );
  }

  static ThemeData get darkTheme => lightTheme;
}
