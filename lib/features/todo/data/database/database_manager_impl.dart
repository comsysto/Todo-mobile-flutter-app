import 'package:isar/isar.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/data/model/project_model.dart';
import 'package:todo_app/features/todo/data/model/todo_item_model.dart';

class DatabaseManagerImpl implements DatabaseManager {
  final Isar _dbInstance;

  const DatabaseManagerImpl(this._dbInstance);

  @override
  Future<List<ProjectModel>> getAllProjects() async =>
      _dbInstance.projectModels.where().findAllSync();

  @override
  Future<void> insertNewProject(final ProjectModel project) async =>
      _dbInstance.writeTxnSync(() => _dbInstance.projectModels.putSync(project));

  @override
  Future<void> removeProjectById(int id) async =>
      _dbInstance.writeTxnSync(() => _dbInstance.projectModels.delete(id));

  @override
  Future<void> updateProject(ProjectModel project) async =>
      _dbInstance.writeTxnSync(() => _dbInstance.projectModels.putSync(project));

  @override
  Future<List<TodoItemModel>> getAllTodosForProject(final int projectId) async {
    final project = await _dbInstance.projectModels.get(projectId);
    return project?.todoList.toList() ?? [];
  }

  @override
  Future<void> insertNewTodo(final int projectId, final TodoItemModel todo) async {
    final project = await _dbInstance.projectModels.get(projectId);
    project?.todoList.toList(growable: true).add(todo);
    print('MANAGER, TODO ITEM ADDED');
    project?.todoList.forEach((element) => 'Todo in project: $element');

    _dbInstance.writeTxnSync(() => _dbInstance.projectModels.putSync(project!));
  }

  @override
  Future<void> removeTodo(final int projectId, final TodoItemModel todoModel) async {
    final project = await _dbInstance.projectModels.get(projectId);
    project?.todoList.toList().removeWhere((todo) => todo == todoModel);

    _dbInstance.writeTxnSync(() => _dbInstance.projectModels.putSync(project!));
  }
}
