import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/di.dart';

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _createProject(ref),
                child: const Text('Create project'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _createTodo(ref),
                child: const Text('Create todo'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _completeTodo(ref),
                child: const Text('Complete todo'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createProject(final WidgetRef ref) async {
    await ref.read(testProvider).createNewProject();
    await ref.read(testProvider).getAllProjects();
  }

  void _createTodo(final WidgetRef ref) async {
    await ref.read(testProvider).createNewTodo();
    await ref.read(testProvider).getAllTodosForProject(1);
    await ref.read(testProvider).getAllProjects();
  }

  void _completeTodo(final WidgetRef ref) async {
    await ref.read(testProvider).completeTodo();
    await ref.read(testProvider).getAllTodosForProject(1);
    await ref.read(testProvider).getAllProjects();
  }
}
