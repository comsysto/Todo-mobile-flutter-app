import 'package:isar/isar.dart';
import 'package:todo_app/features/todo/data/database/isar/model/todo_item_isar_model.dart';

part 'project_isar_model.g.dart';

@collection
class ProjectIsarModel {  
  final Id id = Isar.autoIncrement;
  final String title;
  final List<TodoItemIsarModel> todoItems;

  const ProjectIsarModel({required this.title, this.todoItems = const []});
}
