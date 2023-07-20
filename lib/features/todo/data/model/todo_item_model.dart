import 'package:isar/isar.dart';

part 'todo_item_model.g.dart';

@embedded
class TodoItemModel {
  late String title;
  String? description;
  DateTime? dueDate;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is TodoItemModel &&
        other.title == title &&
        other.description == description &&
        other.dueDate == dueDate;
  }

  @override
  int get hashCode => title.hashCode + description.hashCode - dueDate.hashCode;

  @override
  String toString() => '$title $description ${dueDate?.toIso8601String()}';
}
