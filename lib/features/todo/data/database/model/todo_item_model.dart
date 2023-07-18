import 'package:isar/isar.dart';

part 'todo_item_model.g.dart';

@embedded
class TodoItemModel {
  String? title;
  String? description;
  DateTime? dueDate;
}