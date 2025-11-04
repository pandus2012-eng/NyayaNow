import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Tiny locale-aware theme chooser.
///
/// Use `LocaleTheme.forLocale(locale)` to get a pair of light/dark ThemeData
/// customized for the given locale's language code.
class LocaleTheme {
  final ThemeData light;
  final ThemeData dark;

  LocaleTheme({required this.light, required this.dark});

  static LocaleTheme forLocale(Locale locale) {
    final lang = locale.languageCode.toLowerCase();

    switch (lang) {
      case 'hi': // Hindi / Devanagari - warm accent
        return _buildPair(
          const Color(0xFFB91C1C), // warm red
          useNoto: true,
        );
      case 'bn': // Bengali - green accent
        return _buildPair(
          const Color(0xFF047857), // emerald
          useNoto: true,
        );
      case 'es': // Spanish - amber accent
        return _buildPair(
          const Color(0xFFB45309),
        );
      default: // English and other languages - blue accent
        return _buildPair(const Color(0xFF2563EB));
    }
  }

  static LocaleTheme _buildPair(Color seed, {bool useNoto = false}) {
    final light = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: seed),
      useMaterial3: true,
      textTheme: useNoto
          ? GoogleFonts.notoSansTextTheme()
          : GoogleFonts.poppinsTextTheme(),
    );

    final dark = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
      useMaterial3: true,
      textTheme: useNoto
          ? GoogleFonts.notoSansTextTheme(ThemeData(brightness: Brightness.dark).textTheme)
          : GoogleFonts.poppinsTextTheme(ThemeData(brightness: Brightness.dark).textTheme),
    );

    return LocaleTheme(light: light, dark: dark);
  }
}
