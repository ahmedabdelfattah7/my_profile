import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get headingIndieFlower => GoogleFonts.indieFlower();
  static TextStyle get bodyInter => GoogleFonts.inter();

  static TextTheme getTextTheme(Color textColor, Color secondaryTextColor) {
    return TextTheme(
      displayLarge: headingIndieFlower.copyWith(
        fontSize: 72,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      displayMedium: headingIndieFlower.copyWith(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      displaySmall: headingIndieFlower.copyWith(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineMedium: headingIndieFlower.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      headlineSmall: headingIndieFlower.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleLarge: headingIndieFlower.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),

      bodyLarge: bodyInter.copyWith(fontSize: 18, color: textColor),
      bodyMedium: bodyInter.copyWith(fontSize: 16, color: textColor),
      bodySmall: bodyInter.copyWith(fontSize: 14, color: secondaryTextColor),
      labelLarge: bodyInter.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
    );
  }
}
