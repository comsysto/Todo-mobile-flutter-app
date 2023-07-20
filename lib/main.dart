import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/route_generator.dart';
import 'package:todo_app/core/style/colors.dart';

void main() => runApp(const ProviderScope(child: MainApp()));

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: primaryColor,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: RouteGenerator.startScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
