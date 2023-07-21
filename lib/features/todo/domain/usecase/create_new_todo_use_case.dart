import 'package:todo_app/features/todo/domain/entity/todo_item.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

class CreateNewTodoUseCase {
  final TodoRepository _todoRepository;

  const CreateNewTodoUseCase(this._todoRepository);

  Future<void> call(final int projectId, final String todoTitle) async {
    final todo = TodoItem(title: todoTitle, dueDate: DateTime.now());
    await _todoRepository.createNewTodo(projectId, todo);
  }
}