import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale('es');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }
  String getLocale() {
    return _locale.languageCode;
  }
}


class L10n {
  static final all = [
    const Locale('es'),
    const Locale('en'),
  ];
}
