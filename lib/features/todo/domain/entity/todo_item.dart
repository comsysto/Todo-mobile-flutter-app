class TodoItem {
  int? id;
  final String title;
  final DateTime? dueDate;
  bool isDone;

  TodoItem({required this.title, required this.dueDate, this.id, this.isDone = false});

  @override
  String toString() => '$id, $title, ${dueDate?.toIso8601String()}, $isDone';
}
