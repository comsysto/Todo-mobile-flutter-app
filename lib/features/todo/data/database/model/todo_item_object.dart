import 'package:hive/hive.dart';

part 'todo_item_object.g.dart';

@HiveType(typeId: 1)
class TodoItemObject extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  TodoItemObject({required this.id, required this.title});

  @override
  String toString() => '$id, $title';
}