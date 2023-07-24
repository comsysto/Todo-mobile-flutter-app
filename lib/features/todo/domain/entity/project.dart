import 'package:todo_app/features/todo/domain/entity/todo_item.dart';

class Project {
  int? id;
  final String title;
  List<TodoItem> todoList;

  Project({required this.title, required this.todoList, this.id});

  @override
  String toString() {
    final buffer = StringBuffer();
    todoList.forEach((element) => buffer.write(element));
    return '$id, $title, ${buffer.toString()}';
  }

  @override
  bool operator ==(dynamic other) =>
      other != null && other is Project && other.id == id && other.title == title;

  @override
  int get hashCode => id.hashCode + title.hashCode - todoList.hashCode;
}
