import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/repository/project_repository.dart';

class GetProjectsUseCase {
  final ProjectRepository _projectRepository;

  const GetProjectsUseCase(this._projectRepository);

  Future<List<Project>> getAll() => _projectRepository.getAllProjects();

  Future<Project> getById(final int projectId) => _projectRepository.getProjectById(projectId);
}
