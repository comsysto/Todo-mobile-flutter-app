import 'package:hive/hive.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_object.dart';

part 'project_object.g.dart';

@HiveType(typeId: 0)
class ProjectObject extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  List<TodoItemObject> todoList;

  ProjectObject({
    required this.title,
    List<TodoItemObject>? todoList,
  }) : todoList = todoList ?? [];
}
