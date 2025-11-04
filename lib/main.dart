import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/splash_screen.dart';
import 'screens/onboarding/language_screen.dart';
import 'screens/onboarding/identity_screen.dart';
import 'screens/onboarding/location_screen.dart';
import 'screens/home_screen.dart';
import 'screens/ai_chat_screen.dart';
import 'screens/know_rights_screen.dart';
import 'screens/help_desk_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const NyayaNowApp());
}

class NyayaNowApp extends StatelessWidget {
  const NyayaNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseLight = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(),
    );

    final baseDark = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF60A5FA), brightness: Brightness.dark),
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData(brightness: Brightness.dark).textTheme),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NyayaNow',
      themeMode: ThemeMode.system,
      theme: baseLight,
      darkTheme: baseDark,
  home: const SplashScreen(),
      routes: {
        SplashScreen.route: (_) => const SplashScreen(),
        LanguageScreen.route: (_) => const LanguageScreen(),
        IdentityScreen.route: (_) => const IdentityScreen(),
        LocationScreen.route: (_) => const LocationScreen(),
        HomeScreen.route: (_) => const HomeScreen(),
        AiChatScreen.route: (_) => const AiChatScreen(),
        KnowRightsScreen.route: (_) => const KnowRightsScreen(),
        HelpDeskScreen.route: (_) => const HelpDeskScreen(),
        ProfileScreen.route: (_) => const ProfileScreen(),
      },
    );
  }
}
