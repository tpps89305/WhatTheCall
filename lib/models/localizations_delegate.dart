import 'package:flutter/material.dart';
import 'package:what_the_call/models/language.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Language> {
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<Language> load(Locale locale) {
    return _load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Language> old) => false;

  static Future<Language> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'zh':
        return LanguageZh();
      default:
        return LanguageEn();
    }
  }
}
