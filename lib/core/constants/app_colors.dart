import 'package:flutter/material.dart';

/// App Color Palette inspired by enterprise accounting & financial platforms
/// such as Zoho Books and QuickBooks (clean, trustworthy, and modern).
class AppColors {
  AppColors._();

  // Primary Brand Colors (Corporate Navy & Indigo)
  static const Color primary = Color(0xFF0F52BA); // Sapphire / Royal Corporate Blue
  static const Color primaryDark = Color(0xFF0A3A82);
  static const Color primaryLight = Color(0xFFEBF3FE);
  static const Color primaryGradientStart = Color(0xFF1E40AF);
  static const Color primaryGradientEnd = Color(0xFF0284C7);

  // Secondary & Accents
  static const Color secondary = Color(0xFF059669); // Growth / Finance Emerald Green
  static const Color secondaryLight = Color(0xFFECFDF5);
  static const Color accent = Color(0xFF0284C7);

  // Background & Surfaces
  static const Color background = Color(0xFFF8FAFC); // Slate 50
  static const Color cardSurface = Colors.white;
  static const Color inputBackground = Color(0xFFF8FAFC);

  // Borders & Dividers
  static const Color border = Color(0xFFE2E8F0); // Slate 200
  static const Color borderFocused = Color(0xFF0F52BA);
  static const Color divider = Color(0xFFE2E8F0);

  // Typography & Text Colors
  static const Color textPrimary = Color(0xFF0F172A); // Slate 900
  static const Color textSecondary = Color(0xFF64748B); // Slate 500
  static const Color textMuted = Color(0xFF94A3B8); // Slate 400

  // Status & Feedback Colors
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFFD1FAE5);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEE2E2);

  // Shadows
  static const Color shadow = Color(0x0A0F172A);
}
