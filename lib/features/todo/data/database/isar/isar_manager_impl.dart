import 'package:isar/isar.dart';
import 'package:todo_app/features/todo/data/converter/project_converter.dart';
import 'package:todo_app/features/todo/data/converter/todo_item_converter.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/data/database/isar/model/project_isar_model.dart';
import 'package:todo_app/features/todo/data/database/model/project_db_dto.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_db_dto.dart';

class IsarManagerImpl implements DatabaseManager {
  final Isar _instance;
  final ProjectIsarModelToDbDtoConverter _projectIsarModelToDbDtoConverter;
  final ProjectDbDtoToIsarModelConverter _projectDbDtoToIsarModelConverter;
  final TodoItemIsarModelToDbDtoConverter _todoItemIsarModelToDbDtoConverter;
  final TodoItemDbDtoToIsarModelConverter _todoItemDbDtoToIsarModelConverter;

  const IsarManagerImpl(
    this._instance,
    this._projectIsarModelToDbDtoConverter,
    this._projectDbDtoToIsarModelConverter,
    this._todoItemIsarModelToDbDtoConverter,
    this._todoItemDbDtoToIsarModelConverter,
  );

  @override
  Future<List<ProjectDbDto>> getAllProjects() async => _instance.projectIsarModels
      .where()
      .findAll()
      .map((model) => _projectIsarModelToDbDtoConverter.convert(model))
      .toList();

  @override
  Future<ProjectDbDto> getProjectById(final int projectId) async {
    final project = _instance.projectIsarModels.get(projectId);
    return _projectIsarModelToDbDtoConverter.convert(project!);
  }

  @override
  Future<List<TodoItemDbDto>> getAllTodosForProject(final int projectId) async {
    final project = _instance.projectIsarModels.get(projectId);
    return project!.todoList
        .map((todo) => _todoItemIsarModelToDbDtoConverter.convert(todo))
        .toList();
  }

  @override
  Future<void> insertNewProject(final ProjectDbDto project) async {
    final model = _projectDbDtoToIsarModelConverter.convert(project);
    _instance.write((_) => _instance.projectIsarModels.put(model));
  }

  @override
  Future<void> insertNewTodo(final int projectId, final TodoItemDbDto todo) async {
    final model = _todoItemDbDtoToIsarModelConverter.convert(todo);
    final project = _instance.projectIsarModels.get(projectId);

    if (project != null) {
      project.todoList = [...project.todoList, model];
      _instance.write((_) => _instance.projectIsarModels.put(project));
    }
  }

  @override
  Future<void> removeProjectById(final int projectId) async =>
      _instance.write((_) => _instance.projectIsarModels.delete(projectId));

  @override
  Future<void> completeTodo(final int projectId, final TodoItemDbDto todo) async {
    final project = _instance.projectIsarModels.get(projectId);
    final model = _todoItemDbDtoToIsarModelConverter.convert(todo);

    if (project != null) {
      project.todoList.where((todo) => todo.id == model.id).first.isDone = true;
      _instance.write((_) => _instance.projectIsarModels.put(project));
    }
  }
}
