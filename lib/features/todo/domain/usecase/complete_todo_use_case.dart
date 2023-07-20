import 'package:todo_app/features/todo/domain/entity/todo_item.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

class CompleteTodoUseCase {
  final TodoRepository _todoRepository;

  const CompleteTodoUseCase(this._todoRepository);

  void call(final int projectId, final TodoItem todo) =>
      _todoRepository.removeTodo(projectId, todo);
}
