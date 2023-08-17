import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/route_generator.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/style/theme.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';

class ProjectCard extends ConsumerWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).cardTheme.shadowColor!,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          DateWidget(date: _getProjectDueDate()),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                _getProjectTaskLength(context),
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              HapticFeedback.mediumImpact();
              _redirectToTaskList(context, ref);
            },
            icon: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }

  DateTime _getProjectDueDate() {
    if (project.todoList.isEmpty) {
      return DateTime.now();
    }
    return project.todoList
        .map((todo) => todo.dueDate)
        .toList()
        .whereType<DateTime>()
        .toList()
        .reduce((current, next) => current.isAfter(next) ? current : next);
  }

  String _getProjectTaskLength(final BuildContext context) {
    if (project.todoList.isEmpty || project.todoList.where((todo) => !todo.isDone).isEmpty) {
      return AppLocalizations.of(context)!.noTasks;
    }
    else {
      return AppLocalizations.of(context)!.nTasks(
        project.todoList.where((todo) => !todo.isDone).toList().length,
      );
    }
  }

  void _redirectToTaskList(final BuildContext context, final WidgetRef ref) {
    ref.read(projectProvider).selectProject(project);
    Navigator.of(context).pushNamed(RouteGenerator.todoListScreen);
  }
}

class DateWidget extends StatelessWidget {
  final DateTime date;

  const DateWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).cardTheme.surfaceTintColor,
      radius: 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat('MMM').format(date),
            style: Theme.of(context).textTheme.dateSmall,
          ),
          Text(
            DateFormat('dd').format(date),
            style: Theme.of(context).textTheme.dateLarge,
          ),
        ],
      ),
    );
  }
}
