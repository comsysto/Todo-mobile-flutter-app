import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/repository/project_repository.dart';

class CreateNewProjectUseCase {
  final ProjectRepository _projectRepository;

  const CreateNewProjectUseCase(this._projectRepository);

  Future<void> call(final String projectName) async {
    final project = Project(title: projectName, todoList: []);
    await _projectRepository.createNewProject(project);
  }
}
