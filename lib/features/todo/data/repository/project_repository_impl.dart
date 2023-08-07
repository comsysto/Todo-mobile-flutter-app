import 'package:todo_app/features/todo/data/converter/project_converter.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/repository/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final DatabaseManager _databaseManager;
  final ProjectDbDtoToEntityConverter _dbDtoToEntityConverter;
  final ProjectEntityToDbDtoConverter _entityToDbDtoConverter;

  const ProjectRepositoryImpl(
    this._databaseManager,
    this._dbDtoToEntityConverter,
    this._entityToDbDtoConverter,
  );

  @override
  Future<List<Project>> getAllProjects() async {
    final projectObjects = await _databaseManager.getAllProjects();
    return projectObjects.map((object) => _dbDtoToEntityConverter.convert(object)).toList();
  }

  @override
  Future<Project> getProjectById(int projectId) async {
    final projectObject = await _databaseManager.getProjectById(projectId);
    return _dbDtoToEntityConverter.convert(projectObject);
  }

  @override
  Future<void> createNewProject(final Project project) async {
    final projectObject = _entityToDbDtoConverter.convert(project);
    await _databaseManager.insertNewProject(projectObject);
  }

  @override
  Future<void> removeProject(final Project project) =>
      _databaseManager.removeProjectById(project.id!);
}
