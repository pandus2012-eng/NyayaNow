import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme({String? localeCode}) {
    final fontFamily = localeCode == 'kn'
        ? 'NotoSansKannada'
        : localeCode == 'hi'
            ? 'NotoSansDevanagari'
            : GoogleFonts.inter().fontFamily;

    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.constitutionBlue,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.constitutionBlue),
      scaffoldBackgroundColor: AppColors.ivory,
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ).copyWith(
        titleLarge: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: AppColors.constitutionBlue,
        ),
      ),
      fontFamily: fontFamily,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.constitutionBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
