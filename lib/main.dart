import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/route_generator.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/style/theme.dart';
import 'package:todo_app/features/todo/data/database/hive/hive_datasource.dart';
import 'package:todo_app/features/todo/data/database/isar/isar_datasource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefsInstance = await SharedPreferences.getInstance();
  final isarInstance = await initIsar();
  await initHive();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPrefsInstance),
      isarDatasourceProvider.overrideWithValue(isarInstance),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(notificationServiceProvider).init();
    final isDarkThemeState = ref.watch(appThemeProvider).isDarkMode;
    final currentLocale = ref.watch(localeProvider).currentLocale;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkThemeState ? ThemeMode.dark : ThemeMode.light,
      initialRoute: RouteGenerator.homeScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      locale: currentLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
