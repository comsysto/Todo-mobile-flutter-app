import 'package:todo_app/features/todo/domain/entity/todo_item.dart';

class Project {
  final String title;
  final List<TodoItem> todoList;

  const Project(this.title, this.todoList);
}
