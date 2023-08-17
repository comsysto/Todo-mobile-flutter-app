import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/features/settings/presentation/util/extensions.dart';

class LanguageMenu {
  static Future<Locale?> showLanguageMenu(final BuildContext context) =>
      Platform.isIOS ? _showCupertinoActionScheet(context) : _showSimpleDialog(context);

  static Future<Locale?> _showCupertinoActionScheet(final BuildContext context) =>
      showCupertinoModalPopup<Locale>(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: Text(AppLocalizations.of(context)!.changeLanguage),
          actions: AppLocalizations.supportedLocales
              .map(
                (locale) => CupertinoActionSheetAction(
                  onPressed: () => Navigator.pop(context, locale),
                  child: Text(locale.toLanguageString(context)),
                ),
              )
              .toList(),
          cancelButton: CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
        ),
      );

  static Future<Locale?> _showSimpleDialog(final BuildContext context) => showDialog<Locale>(
        context: context,
        builder: (context) => SimpleDialog(
          title: Text(AppLocalizations.of(context)!.changeLanguage),
          children: AppLocalizations.supportedLocales
              .map(
                (locale) => SimpleDialogOption(
                  onPressed: () => Navigator.pop(context, locale),
                  child: Text(locale.toLanguageString(context)),
                ),
              )
              .toList(),
        ),
      );
}
