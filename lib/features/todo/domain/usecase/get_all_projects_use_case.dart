import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/repository/project_repository.dart';

class GetAllProjectsUseCase {
  final ProjectRepository _projectRepository;

  const GetAllProjectsUseCase(this._projectRepository);

  Future<List<Project>> call() async => await _projectRepository.getAllProjects();
}
