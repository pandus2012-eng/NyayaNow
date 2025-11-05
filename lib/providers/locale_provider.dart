import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  static const _kKey = 'locale_code';
  Locale? _locale;

  Locale? get locale => _locale;

  LocaleProvider() {
    _load();
  }

  Future<void> _load() async {
    final sp = await SharedPreferences.getInstance();
    final code = sp.getString(_kKey);
    if (code != null) {
      _locale = Locale(code);
      notifyListeners();
    }
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    notifyListeners();
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kKey, locale.languageCode);
  }
}
