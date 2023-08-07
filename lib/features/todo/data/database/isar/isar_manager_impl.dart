import 'package:isar/isar.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/data/database/isar/model/project_isar_model.dart';
import 'package:todo_app/features/todo/data/database/model/project_db_dto.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_db_dto.dart';

class IsarManagerImpl implements DatabaseManager {
  final Isar _instance;
  //inject model to dto converter
  //inject dto to model converter

  const IsarManagerImpl(this._instance);

  @override
  Future<List<ProjectDbDto>> getAllProjects() async {
    final projectIsarModels = await _instance.projectIsarModels.where().findAll();
    //convert isar model to db_dto object
    throw UnimplementedError();
  }

  @override
  Future<ProjectDbDto> getProjectById(final int projectId) {
    throw UnimplementedError();
  }

  @override
  Future<List<TodoItemDbDto>> getAllTodosForProject(final int projectId) {
    throw UnimplementedError();
  }

  @override
  Future<void> insertNewProject(final ProjectDbDto project) {
    throw UnimplementedError();
  }

  @override
  Future<void> insertNewTodo(final int projectId, final TodoItemDbDto todo) {
    throw UnimplementedError();
  }

  @override
  Future<void> removeProjectById(final int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> completeTodo(final int projectId, final TodoItemDbDto todo) {
    throw UnimplementedError();
  }
}
