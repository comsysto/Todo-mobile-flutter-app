import 'package:hive/hive.dart';
import 'package:todo_app/features/todo/data/database/hive/model/todo_item_hive_model.dart';

part 'project_hive_model.g.dart';

@HiveType(typeId: 0)
class ProjectHiveModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  List<TodoItemHiveModel> todoList;

  ProjectHiveModel({
    required this.title,
    this.todoList = const [],
  });
}
