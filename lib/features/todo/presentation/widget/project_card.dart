import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: foregroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: Offset(0, 4),
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
              Text(project.title, style: mediumTextStyle),
              Text(_getProjectTaskLength(), style: detailsTextStyle),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () => _redirectToTaskList(context),
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

  String _getProjectTaskLength() {
    if (project.todoList.isEmpty) {
      return 'No tasks';
    } else if (project.todoList.length == 1) {
      return '1 task remaining';
    } else {
      return '${project.todoList.length} tasks remaining';
    }
  }

  void _redirectToTaskList(final BuildContext context) {
    print('Show dialog with details');
  }
}

class DateWidget extends StatelessWidget {
  final DateTime date;

  const DateWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFFEFEFEF),
      radius: 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat('MMM').format(date),
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          ),
          Text(
            DateFormat('dd').format(date),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
