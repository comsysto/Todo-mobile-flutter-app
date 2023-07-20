import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/repository/project_repository.dart';

class CreateNewProjectUseCase {
  final ProjectRepository _projectRepository;

  const CreateNewProjectUseCase(this._projectRepository);

  void call(final String projectName) {
    final project = Project(projectName);
    _projectRepository.createNewProject(project);
  }
}
