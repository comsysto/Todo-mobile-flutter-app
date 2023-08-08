import 'package:isar/isar.dart';
import 'package:todo_app/features/todo/data/database/isar/model/todo_item_isar_model.dart';

part 'project_isar_model.g.dart';

@collection
class ProjectIsarModel {
  int id;
  String title;
  List<TodoItemIsarModel> todoList;

  ProjectIsarModel({required this.id, required this.title, this.todoList = const []});
}
