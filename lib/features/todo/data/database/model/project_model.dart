import 'package:isar/isar.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_model.dart';

part 'project_model.g.dart';

@collection
class ProjectModel {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? title;

  List<TodoItemModel>? todoList;
}