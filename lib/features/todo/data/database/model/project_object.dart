import 'package:hive/hive.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_object.dart';

part 'project_object.g.dart';

@HiveType(typeId: 0)
class ProjectObject extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  List<TodoItemObject> todoList;

  ProjectObject({
    required this.id,
    required this.title,
    List<TodoItemObject>? todoList,
  }) : todoList = todoList ?? []; //TODO: Check this out if it works as intented

  @override
  String toString() {
    final todos = StringBuffer();
    todoList.forEach((todo) => todos.write('[$todo]'));
    return '$id, $title, ${todos.toString()}';
  }
}
