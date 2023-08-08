class TodoItemDbDto {
  final int? id;
  final String title;
  final DateTime? dueDate;
  final bool isDone;

  const TodoItemDbDto({this.id, required this.title, this.dueDate, this.isDone = false});

  @override
  String toString() => '$id, $title, $dueDate, $isDone';
}
