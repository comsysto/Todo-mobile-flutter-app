import 'package:flutter/material.dart';
import 'package:todo_app/features/home/presentation/screen/home_screen.dart';
import 'package:todo_app/features/home/presentation/screen/start_screen.dart';
import 'package:todo_app/features/settings/presentation/screen/settings_screen.dart';
import 'package:todo_app/features/todo/presentation/screen/new_task_screen.dart';
import 'package:todo_app/features/todo/presentation/screen/task_screen.dart';

class RouteGenerator {
  static const startScreen = '/';
  static const homeScreen = '/home';
  static const taskScreen = '/tasks';
  static const newTaskScreen = '/newTask';
  static const settingsScreen = '/settings';

  RouteGenerator._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case startScreen:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case taskScreen:
        return MaterialPageRoute(builder: (_) => const TaskScreen());
      case newTaskScreen:
        return MaterialPageRoute(builder: (_) => const NewTaskScreen());
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        throw Exception('Route not found...');
    }
  }
}
