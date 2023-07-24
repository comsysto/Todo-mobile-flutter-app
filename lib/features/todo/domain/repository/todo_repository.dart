import 'package:todo_app/features/todo/domain/entity/todo_item.dart';

abstract class TodoRepository {
  Future<List<TodoItem>> getAllTodosForProject(int project);
  Future<void> createNewTodo(int projectId, TodoItem todoItem);
  Future<void> completeTodo(int projectId, TodoItem todoItem);
}
