import 'package:flutter/material.dart';

class AppLocale extends ChangeNotifier {
  Locale _locale = const Locale('ru');

  Locale get locale => _locale;

  void toggle() {
    _locale = _locale.languageCode == 'ru' ? const Locale('en') : const Locale('ru');
    notifyListeners();
  }
}
