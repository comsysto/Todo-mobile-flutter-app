import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/route_generator.dart';
import 'package:todo_app/features/settings/presentation/screen/settings_screen.dart';
import 'package:todo_app/features/todo/presentation/screen/projects_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  final _screens = const [
    ProjectsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNavBarIndex = useState(0);
    return Scaffold(
      body: IndexedStack(
        index: selectedNavBarIndex.value,
        children: _screens,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _redirectToNewTaskScreen(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (final int index) =>
            selectedNavBarIndex.value = index,
        selectedIndex: selectedNavBarIndex.value,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  void _redirectToNewTaskScreen(final BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.newTaskScreen);
}
