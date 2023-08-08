import 'package:isar/isar.dart';

part 'todo_item_isar_model.g.dart';

@embedded
class TodoItemIsarModel {
  final int id;
  final String? title;
  final DateTime? dueDate;
  bool? isDone;

  TodoItemIsarModel({required this.id, this.title, this.dueDate, this.isDone = false});
}
