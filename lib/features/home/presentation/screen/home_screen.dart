import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/route_generator.dart';
import 'package:todo_app/features/common/presentation/widget/custom_bottom_nav_bar.dart';
import 'package:todo_app/features/settings/presentation/screen/settings_screen.dart';
import 'package:todo_app/features/todo/presentation/screen/projects_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  final _screens = const [
    ProjectsScreen(),
    PlaceholderScreen(),
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
      bottomNavigationBar: CustomBottomNavBar(
        onTabChanged: (index) {
          if (index == 1) {
            _redirectToNewTaskScreen(context);
            return;
          }
          selectedNavBarIndex.value = index;
        },
        selectedNavBarIndex: selectedNavBarIndex.value,
      ),
    );
  }

  void _redirectToNewTaskScreen(final BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.newTodoScreen);
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
