import 'package:todo_app/features/todo/domain/repository/project_repository.dart';

class GetCompletedTodoNumberUseCase {
  final ProjectRepository _projectRepository;

  const GetCompletedTodoNumberUseCase(this._projectRepository);

  Future<int> call() async {
    final projects = await _projectRepository.getAllProjects();

    final allDoneTasks = projects
        .map((project) => project.todoList)
        .toList()
        .expand((todo) => todo)
        .toList()
        .where((todo) => todo.isDone);

    return allDoneTasks.length;
  }
}
