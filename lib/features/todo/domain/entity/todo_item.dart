class TodoItem {
  final String title;
  final String? description;
  final DateTime? dueDate;

  const TodoItem(
    this.title,
    this.description,
    this.dueDate,
  );

  @override
  String toString() => '$title, $description, ${dueDate?.toIso8601String()}';
}
