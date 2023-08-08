import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/features/todo/data/converter/project_converter.dart';
import 'package:todo_app/features/todo/data/converter/todo_item_converter.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/data/database/hive/model/project_hive_model.dart';
import 'package:todo_app/features/todo/data/database/model/project_db_dto.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_db_dto.dart';

class HiveManagerImpl implements DatabaseManager {
  static const projectsBox = 'projects';
  final ProjectHiveModelToDbDtoConverter _projectHiveModelToDbDtoConverter;
  final ProjectDbDtoToHiveModelConverter _projectDbDtoToHiveModelConverter;
  final TodoItemHiveModelToDbDtoConverter _todoItemHiveModelToDbDtoConverter;
  final TodoItemDbDtoToHiveModelConverter _todoItemDbDtoToHiveModelConverter;

  const HiveManagerImpl(
    this._projectHiveModelToDbDtoConverter,
    this._projectDbDtoToHiveModelConverter,
    this._todoItemHiveModelToDbDtoConverter,
    this._todoItemDbDtoToHiveModelConverter,
  );

  @override
  Future<List<ProjectDbDto>> getAllProjects() async =>
      (await Hive.openBox<ProjectHiveModel>(projectsBox))
          .values
          .toList()
          .map((model) => _projectHiveModelToDbDtoConverter.convert(model))
          .toList();

  @override
  Future<ProjectDbDto> getProjectById(final int projectId) async {
    final projects = await Hive.openBox<ProjectHiveModel>(projectsBox);
    final projectModel = projects.values.firstWhere((project) => project.key == projectId);
    return _projectHiveModelToDbDtoConverter.convert(projectModel);
  }

  @override
  Future<List<TodoItemDbDto>> getAllTodosForProject(final int projectId) async {
    final projects = await Hive.openBox<ProjectHiveModel>(projectsBox);
    return projects
            .get(projectId)
            ?.todoList
            .map((model) => _todoItemHiveModelToDbDtoConverter.convert(model))
            .toList() ??
        [];
  }

  @override
  Future<void> insertNewProject(final ProjectDbDto projectDto) async {
    final projects = await Hive.openBox<ProjectHiveModel>(projectsBox);
    final projectModel = _projectDbDtoToHiveModelConverter.convert(projectDto);
    await projects.add(projectModel);
  }

  @override
  Future<void> insertNewTodo(final int projectId, final TodoItemDbDto todoDto) async {
    final projects = await Hive.openBox<ProjectHiveModel>(projectsBox);
    final project = projects.get(projectId);
    final todoModel = _todoItemDbDtoToHiveModelConverter.convert(todoDto);

    if (project != null) {
      project.todoList.add(todoModel);
      await project.save();
    }
  }

  @override
  Future<void> removeProjectById(final int projectId) async {
    final projects = await Hive.openBox<ProjectHiveModel>(projectsBox);
    await projects.delete(projectId);
  }

  @override
  Future<void> completeTodo(final int projectId, final TodoItemDbDto todoDto) async {
    final projects = await Hive.openBox<ProjectHiveModel>(projectsBox);
    final project = projects.get(projectId);
    final todoModel = _todoItemDbDtoToHiveModelConverter.convert(todoDto);

    if (project != null) {
      final index = project.todoList.indexWhere((todo) => todo.id == todoModel.id);
      project.todoList[index].isDone = true;
      await project.save();
    }
  }
}
