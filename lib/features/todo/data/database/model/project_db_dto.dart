import 'package:todo_app/features/todo/data/database/model/todo_item_db_dto.dart';

class ProjectDbDto {
  final int? id;
  final String title;
  final List<TodoItemDbDto> todoList;

  const ProjectDbDto({this.id, required this.title, this.todoList = const []});

  @override
  String toString() => '$id, $title, $todoList';
}
