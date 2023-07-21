import 'package:todo_app/features/todo/domain/entity/todo_item.dart';

class Project {
  int? id;
  final String title;
  List<TodoItem> todoList;

  Project({required this.title, required this.todoList, this.id});
}
