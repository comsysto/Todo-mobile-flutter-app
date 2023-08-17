import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/style/colors.dart';
import 'package:todo_app/features/settings/presentation/widget/change_language_button.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(appThemeProvider).isDarkMode;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.settings,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.lightTheme,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        CupertinoSwitch(
                          trackColor: secondaryColorLight,
                          activeColor: Colors.black,
                          value: isDarkMode,
                          onChanged: (value) => ref.read(appThemeProvider).updateAppTheme(value),
                        ),
                        Text(
                          AppLocalizations.of(context)!.darkTheme,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(AppLocalizations.of(context)!.language),
                        const Spacer(),
                        const ChangeLanguageButton(),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                AppLocalizations.of(context)!.copyrightMessage,
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
