import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/route_generator.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/style/theme.dart';
import 'package:todo_app/features/todo/data/database/hive_datasource.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkThemeState = ref.watch(appThemeProvider).isDarkMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkThemeState ? ThemeMode.dark : ThemeMode.light,
      initialRoute: RouteGenerator.startScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
