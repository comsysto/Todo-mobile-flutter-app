import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/riverpod/locale_provider.dart';
import 'package:todo_app/features/settings/presentation/util/extensions.dart';
import 'package:todo_app/features/settings/presentation/widget/language_menu.dart';

class ChangeLanguageButton extends ConsumerWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider).currentLocale;
    return TextButton(
      onPressed: () async {
        final locale = await LanguageMenu.showLanguageMenu(context);
        if (locale != null) {
          final language = switch (locale.languageCode) {
            'en' => Language.en,
            'hr' => Language.hr,
            'de' => Language.de,
            _ => Language.en,
          };
          ref.read(localeProvider).updateLocale(language);
        }
      },
      child: Text(currentLocale.toLanguageString(context)),
    );
  }
}
