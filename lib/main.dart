import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/i18n/app_localizations.dart';
import 'core/routing/app_router.dart';
import 'providers/locale_provider.dart';

void main() => runApp(const NyayaNowApp());

class NyayaNowApp extends StatelessWidget {
  const NyayaNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (_, provider, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'NyayaNow',
            locale: provider.locale,
            supportedLocales: const [Locale('en'), Locale('hi'), Locale('kn')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: Colors.deepPurple,
              fontFamily: () {
                final lang = provider.locale?.languageCode;
                if (lang == 'kn') return 'NotoSansKannada';
                if (lang == 'hi') return 'NotoSansDevanagari';
                return null;
              }(),
            ),
            initialRoute: AppRoutes.splash,
            routes: AppRoutes.map,
          );
        },
      ),
    );
  }
}
