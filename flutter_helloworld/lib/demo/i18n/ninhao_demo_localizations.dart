import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NinhaoDemoLocalizations {
  final Locale locale;

  static NinhaoDemoLocalizations of(BuildContext context) {
    return Localizations.of(context, NinhaoDemoLocalizations);
  }

  NinhaoDemoLocalizations(this.locale);
  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    },
  };
  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class NinhaoDemoLocalizationsDelegate
    extends LocalizationsDelegate<NinhaoDemoLocalizations> {
  NinhaoDemoLocalizationsDelegate();
  @override
  Future<NinhaoDemoLocalizations> load(Locale locale) {
    return SynchronousFuture(NinhaoDemoLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<NinhaoDemoLocalizations> old) {
    return false;
  }
}
