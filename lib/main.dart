import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding/language_screen.dart';
import 'screens/onboarding/identity_screen.dart';
import 'screens/onboarding/location_screen.dart';
import 'screens/home_screen.dart';
import 'screens/ai_chat_screen.dart';
import 'screens/know_rights_screen.dart';
import 'screens/help_desk_screen.dart';
import 'screens/profile_screen.dart';
import 'theme/locale_theme.dart';

void main() {
  runApp(const NyayaNowApp());
}

class NyayaNowApp extends StatelessWidget {
  const NyayaNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Resolve a theme pair from the system locale. Using the
    // platformDispatcher avoids requiring a BuildContext here.
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    final localeTheme = LocaleTheme.forLocale(locale);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NyayaNow',
  themeMode: ThemeMode.system,
  theme: localeTheme.light,
  darkTheme: localeTheme.dark,
      initialRoute: SplashScreen.route,
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
