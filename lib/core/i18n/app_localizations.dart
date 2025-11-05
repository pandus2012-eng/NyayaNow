import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;
  late Map<String, dynamic> _map;

  AppLocalizations(this.locale);

  static const supportedLocales = [
    Locale('en'),
    Locale('hi'),
    Locale('kn'),
  ];

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  Future<void> load() async {
    final data = await rootBundle
        .loadString('assets/translations/${locale.languageCode}.json');
    _map = jsonDecode(data) as Map<String, dynamic>;
  }

  String t(String key, {String fallback = ''}) => _map[key] as String? ?? fallback;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.supportedLocales.map((l) => l.languageCode).contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final loc = AppLocalizations(locale);
    await loc.load();
    return loc;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
