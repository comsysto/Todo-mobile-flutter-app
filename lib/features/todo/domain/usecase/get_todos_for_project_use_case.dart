import 'package:todo_app/features/todo/domain/entity/todo_item.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

class GetTodosForProjectUseCase {
  final TodoRepository _todoRepository;

  const GetTodosForProjectUseCase(this._todoRepository);

  Future<List<TodoItem>> call(final int projectId) async {
    final todoList = await _todoRepository.getAllTodosForProject(projectId);
    return todoList.where((todo) => !todo.isDone).toList(); //TODO: REMOVE LATER
  }
}
