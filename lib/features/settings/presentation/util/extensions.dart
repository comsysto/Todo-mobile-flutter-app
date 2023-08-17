import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocaleToLanguage on Locale {
  String toLanguageString(context) {
    switch (languageCode) {
      case 'en':
        return AppLocalizations.of(context)!.english;
      case 'de':
        return AppLocalizations.of(context)!.german;
      case 'hr':
        return AppLocalizations.of(context)!.croatian;
      default:
        return 'Language not defined';
    }
  }
}
