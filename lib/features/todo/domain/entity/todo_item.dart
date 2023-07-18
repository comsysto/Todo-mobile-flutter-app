import 'package:todo_app/features/todo/domain/entity/project.dart';

class TodoItem {
  final String title;
  final String description;
  final DateTime dueDate;
  final Project project;

  const TodoItem(
    this.title,
    this.description,
    this.dueDate,
    this.project,
  );
}
