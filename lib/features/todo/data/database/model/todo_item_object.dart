import 'package:hive/hive.dart';

part 'todo_item_object.g.dart';

@HiveType(typeId: 1)
class TodoItemObject extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  DateTime? dueDate;

  @HiveField(3)
  bool isDone;

  TodoItemObject({required this.title, this.dueDate, this.id, this.isDone = false});

  @override
  String toString() => '$id, $title';

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is TodoItemObject && other.id == id && other.title == title;
  }

  @override
  int get hashCode => (title.hashCode + dueDate.hashCode) ~/ 2;
}
