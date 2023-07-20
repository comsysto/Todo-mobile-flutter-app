import 'package:isar/isar.dart';
import 'package:todo_app/features/todo/data/model/todo_item_model.dart';

part 'project_model.g.dart';

@collection
class ProjectModel {

  Id id = Isar.autoIncrement;
  final String title;
  final List<TodoItemModel> todoList;

  ProjectModel(this.title, this.todoList);

  @override
  String toString() {
    final todoStringList = StringBuffer();
    todoList.forEach((todo) => todoStringList.write('${todo.toString()}\n'));
    return '$id, $title, ${todoStringList.toString()}';
  }
}