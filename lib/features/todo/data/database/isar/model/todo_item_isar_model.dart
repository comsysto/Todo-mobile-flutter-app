import 'package:isar/isar.dart';

part 'todo_item_isar_model.g.dart';

@embedded
class TodoItemIsarModel {
  final String? title;
  final DateTime? dueDate;
  final bool? isDone;

  const TodoItemIsarModel({this.title, this.dueDate, this.isDone});
}