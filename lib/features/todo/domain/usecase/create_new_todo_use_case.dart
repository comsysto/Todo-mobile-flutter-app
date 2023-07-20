import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';
import 'package:todo_app/features/todo/domain/repository/project_repository.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

class CreateNewTodoUseCase {
  final TodoRepository _todoRepository;
  final ProjectRepository _projectRepository;

  const CreateNewTodoUseCase(this._todoRepository, this._projectRepository);

  Future<void> call(final Project project, final TodoItem todoItem) async {
    await _todoRepository.createNewTodo(project.id!, todoItem);
    project.todoList?.add(todoItem);
    await _projectRepository.updateProject(project);
  }
}