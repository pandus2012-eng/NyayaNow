import 'screens/onboarding/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'providers/locale_provider.dart';

void main() {
  runApp(NyayaNowApp());
}

class NyayaNowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (context, provider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'NyayaNow',
            locale: provider.locale,
            supportedLocales: [Locale('en'), Locale('kn'), Locale('hi')],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: Colors.deepPurple,
              fontFamily: provider.locale?.languageCode == 'kn'
                  ? 'NotoSansKannada'
                  : provider.locale?.languageCode == 'hi'
                  ? 'NotoSansDevanagari'
                  : null,
            ),
            home: LanguageSelectionScreen(),
          );
        },
      ),
    );
  }
}
