import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/style/text_styles.dart';
import 'package:todo_app/features/common/presentation/style/theme.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';
import 'package:todo_app/features/todo/presentation/util/dialog_utils.dart';
import 'package:todo_app/features/todo/presentation/widget/todo_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoListScreen extends ConsumerWidget {
  final int? projectId;

  const TodoListScreen({super.key, this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProject =
        ref.watch(projectProvider.select((provider) => provider.selectedProject!));
    final todoListState = ref.watch(
      todoProvider(selectedProject.id!).select((provider) => provider.todoListState),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  AppLocalizations.of(context)!.taskList,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 250,
                child: Text(selectedProject.title, style: Theme.of(context).textTheme.titleLarge),
              ),
              const SizedBox(height: 20),
              todoListState!.when(
                data: (todoList) => todoList.isEmpty
                    ? NoTasks(
                        onDeletePressed: () {
                          HapticFeedback.mediumImpact();
                          _showDeleteConfirmationDialog(context, ref, selectedProject);
                        },
                      )
                    : TasksList(
                        selectedProjectId: selectedProject.id!,
                        todoList: todoList,
                        onDeletePressed: () {
                          HapticFeedback.mediumImpact();
                          _showDeleteConfirmationDialog(context, ref, selectedProject);
                        },
                      ),
                error: (error, _) => Expanded(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.thereWasAnError,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
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
      title: AppLocalizations.of(context)!.deleteProject,
      content: AppLocalizations.of(context)!.deleteProjectDescription(selectedProject.title),
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
            child: Text(
              AppLocalizations.of(context)!.deleteProject,
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
    final isDarkThemeState = ref.watch(appThemeProvider).isDarkMode;
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            isDarkThemeState
                ? const Image(
                    image: AssetImage('assets/images/success_dark.png'),
                    width: 200,
                  )
                : const Image(
                    image: AssetImage('assets/images/success_light.png'),
                    width: 200,
                  ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.goodJobNoTasksLeft,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            TextButton(
              onPressed: onDeletePressed,
              child: Text(
                AppLocalizations.of(context)!.deleteProject,
                style: Theme.of(context).textTheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
