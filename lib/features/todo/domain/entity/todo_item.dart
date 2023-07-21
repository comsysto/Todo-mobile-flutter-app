class TodoItem {
  int? id;
  final String title;
  final DateTime? dueDate;

  TodoItem({required this.title, required this.dueDate, this.id});

  @override
  String toString() => '$id, $title, ${dueDate?.toIso8601String()}';
}
