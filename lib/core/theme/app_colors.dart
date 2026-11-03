import 'package:flutter/material.dart';

class AppColors {
  // Primary dark tones (Navy)
  static const Color primaryNavy = Color(0xFF060B1E);
  static const Color deepNavy = Color(0xFF091124);
  static const Color cardNavy = Color(0xFF0D1B3E);
  static const Color contactNavy = Color(0xFF0B142F);
  
  // Teal / Turquoise Accents
  static const Color accentTeal = Color(0xFF20C997);
  static const Color brightTeal = Color(0xFF00D2AA);
  static const Color lightTeal = Color(0xFF14B8A6);
  static const Color tealGlow = Color(0x3320C997);
  static const Color tealBadgeBg = Color(0x1F20C997);
  static const Color tealBadgeBorder = Color(0x4020C997);
  
  // Gradients
  static const LinearGradient tealGradient = LinearGradient(
    colors: [Color(0xFF00D2AA), Color(0xFF20C997)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient heroNavyGradient = LinearGradient(
    colors: [Color(0xFF050A1A), Color(0xFF0B1533), Color(0xFF0D1C44)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient contactCardGradient = LinearGradient(
    colors: [Color(0xFF0B132B), Color(0xFF0F1E3D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Light main content backgrounds
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF8FAFC);
  static const Color cardLight = Color(0xFFFFFFFF);
  
  // Text Colors
  static const Color textDark = Color(0xFF0F172A);
  static const Color textSlate = Color(0xFF64748B);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color textWhite = Color(0xFFFFFFFF);
  
  // Borders and Dividers
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderSubtle = Color(0xFFEDF2F7);
  static const Color borderDark = Color(0x26FFFFFF);
}

