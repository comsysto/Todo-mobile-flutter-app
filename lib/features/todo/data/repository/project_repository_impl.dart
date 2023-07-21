import 'package:todo_app/features/todo/data/converter/project_converter.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/repository/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final DatabaseManager _databaseManager;
  final ProjectObjectToEntityConverter _objectToEntityConverter;
  final ProjectEntityToObjectConverter _entityToObjectConverter;
  static int _nextId = 0;

  const ProjectRepositoryImpl(
    this._databaseManager,
    this._objectToEntityConverter,
    this._entityToObjectConverter,
  );

  @override
  Future<List<Project>> getAllProjects() async {
    final projectObjects = await _databaseManager.getAllProjects();
    return projectObjects.map((object) => _objectToEntityConverter.convert(object)).toList();
  }

  @override
  Future<void> createNewProject(final Project project) async {
    _nextId++;
    project.id = _nextId;
    final projectModel = _entityToObjectConverter.convert(project);
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
