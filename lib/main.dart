import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  runApp(const NyayaApp());
}

class NyayaApp extends StatefulWidget {
  const NyayaApp({super.key});

  @override
  State<NyayaApp> createState() => _NyayaAppState();
}

class _NyayaAppState extends State<NyayaApp> {
  Locale _locale = WidgetsBinding.instance.platformDispatcher.locale;

  void _setLocale(String code) {
    setState(() {
      _locale = Locale(code);
    });
  }

  @override
  Widget build(BuildContext context) {
    final localeTheme = LocaleTheme.forLocale(_locale);

    // Map a few language codes to local font families (fallbacks).
    final fontFamily = _locale.languageCode == 'kn'
        ? 'NotoSansKannada'
        : _locale.languageCode == 'hi'
            ? 'NotoSansDevanagari'
            : null;

    ThemeData withFont(ThemeData t, String? family) {
      if (family == null) return t;
      return t.copyWith(
        textTheme: t.textTheme.apply(fontFamily: family),
        primaryTextTheme: t.primaryTextTheme.apply(fontFamily: family),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NyayaNow',
      themeMode: ThemeMode.system,
  theme: withFont(localeTheme.light, fontFamily),
  darkTheme: withFont(localeTheme.dark, fontFamily),
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('kn'),
        Locale('hi'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Start the app at the language selection so users can pick fonts/locales.
      home: LanguageScreen(onPick: _setLocale),
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
