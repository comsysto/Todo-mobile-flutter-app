import 'package:todo_app/features/todo/data/converter/project_converter.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/repository/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final DatabaseManager _databaseManager;
  final ProjectModelToEntityConverter _projectModelToEntityConverter;
  final ProjectEntityToModelConverter _projectEntityToModelConverter;

  const ProjectRepositoryImpl(
    this._databaseManager,
    this._projectModelToEntityConverter,
    this._projectEntityToModelConverter,
  );

  @override
  Future<List<Project>> getAllProjects() async {
    final projectModels = await _databaseManager.getAllProjects();
    return projectModels.map((model) => _projectModelToEntityConverter.convert(model)).toList();
  }

  @override
  Future<void> createNewProject(final Project project) async {
    final projectModel = _projectEntityToModelConverter.convert(project);
    await _databaseManager.insertNewProject(projectModel);
  }

  @override
  Future<void> removeProject(Project project) {
    // TODO: implement removeProject
    throw UnimplementedError();
  }

  @override
  Future<void> updateProject(Project project) {
    //_databaseManager.
    throw UnimplementedError();
  }
}
