import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/style/text_styles.dart';
import 'package:todo_app/features/common/presentation/style/theme.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';
import 'package:todo_app/features/todo/presentation/util/dialog_utils.dart';
import 'package:todo_app/features/todo/presentation/widget/todo_card.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProject = ref.watch(
      projectProvider.select((provider) => provider.selectedProject),
    );
    final todoListState = ref.watch(
      todoProvider(selectedProject!.id!).select((provider) => provider.todoListState),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text('Task list', style: Theme.of(context).textTheme.titleSmall)),
              const SizedBox(height: 50),
              SizedBox(
                width: 250,
                child: Text(selectedProject.title, style: Theme.of(context).textTheme.titleLarge),
              ),
              const SizedBox(height: 20),
              todoListState!.when(
                data: (todoList) => todoList.isEmpty
                    ? NoTasks(
                        onDeletePressed: () =>
                            _showDeleteConfirmationDialog(context, ref, selectedProject),
                      )
                    : TasksList(
                        selectedProjectId: selectedProject.id!,
                        todoList: todoList,
                        onDeletePressed: () =>
                            _showDeleteConfirmationDialog(context, ref, selectedProject),
                      ),
                error: (error, _) => Center(
                  child: Text(
                    'There was an error...',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                loading: () => const CircularProgressIndicator.adaptive(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(
    final BuildContext context,
    final WidgetRef ref,
    final Project selectedProject,
  ) async {
    final deleteConfirmed = await DialogUtils.showConfirmationDialog(
      context: context,
      title: 'Delete project',
      content: 'Are you sure to delete ${selectedProject.title}?',
    );
    if (deleteConfirmed) {
      await ref.read(projectProvider).deleteProject(selectedProject);
      await ref.read(projectProvider).getAllProjects();
      await ref.read(projectProvider).getTotalNumberOfCompletedTasks();
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }
}

class TasksList extends ConsumerWidget {
  final int selectedProjectId;
  final List<TodoItem> todoList;
  final VoidCallback onDeletePressed;

  const TasksList({
    super.key,
    required this.selectedProjectId,
    required this.todoList,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              itemBuilder: (_, index) => TodoCard(
                projectId: selectedProjectId,
                todoItem: todoList[index],
              ),
              separatorBuilder: (_, index) => const SizedBox(height: 15),
              itemCount: todoList.length,
            ),
          ),
          TextButton(
            onPressed: onDeletePressed,
            child: const Text(
              'Delete project',
              style: errorTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class NoTasks extends ConsumerWidget {
  final VoidCallback onDeletePressed;

  const NoTasks({super.key, required this.onDeletePressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Image(
              image: AssetImage('assets/images/success.png'),
              width: 200,
            ),
            const SizedBox(height: 20),
            Text('Good job, no tasks left!', style: Theme.of(context).textTheme.titleMedium),
            const Spacer(),
            TextButton(
              onPressed: onDeletePressed,
              child: Text(
                'Delete project',
                style: Theme.of(context).textTheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
