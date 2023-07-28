import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/style/colors.dart';

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
                'Settings',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Light theme',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CupertinoSwitch(
                    trackColor: secondaryColorLight,
                    activeColor: Colors.black,
                    value: isDarkMode,
                    onChanged: (value) => ref.read(appThemeProvider).updateAppTheme(value),
                  ),
                  Text(
                    'Dark theme',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
