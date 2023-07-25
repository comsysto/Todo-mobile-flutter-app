import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/repository/project_repository.dart';

class DeleteProjectUseCase {
  final ProjectRepository _projectRepository;

  const DeleteProjectUseCase(this._projectRepository);

  Future<void> call(final Project project) => _projectRepository.removeProject(project);
}
