import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en');

  void updateLocale(final Language language) {
    _currentLocale = Locale(language.code);
    notifyListeners();
  }

  Locale get currentLocale => _currentLocale;
}

enum Language {
  hr('hr'),
  en('en'),
  de('de');

  final String code;

  const Language(this.code);
}
