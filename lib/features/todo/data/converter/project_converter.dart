import 'package:todo_app/features/todo/data/converter/converter.dart';
import 'package:todo_app/features/todo/data/converter/todo_item_converter.dart';
import 'package:todo_app/features/todo/data/database/hive/model/project_hive_model.dart';
import 'package:todo_app/features/todo/data/database/isar/model/project_isar_model.dart';
import 'package:todo_app/features/todo/data/database/model/project_db_dto.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';

/// ************ HIVE - DTO *************
class ProjectHiveModelToDbDtoConverter implements Converter<ProjectHiveModel, ProjectDbDto> {
  final TodoItemHiveModelToDbDtoConverter _converter;

  const ProjectHiveModelToDbDtoConverter(this._converter);

  @override
  ProjectDbDto convert(final ProjectHiveModel model) {
    final todos = model.todoList.map((todo) => _converter.convert(todo)).toList();
    return ProjectDbDto(id: model.key, title: model.title, todoList: todos);
  }
}

class ProjectDbDtoToHiveModelConverter implements Converter<ProjectDbDto, ProjectHiveModel> {
  final TodoItemDbDtoToHiveModelConverter _converter;

  const ProjectDbDtoToHiveModelConverter(this._converter);

  @override
  ProjectHiveModel convert(final ProjectDbDto dto) {
    final todos = dto.todoList.map((todo) => _converter.convert(todo)).toList();
    return ProjectHiveModel(title: dto.title, todoList: todos);
  }
}

/// ************ ISAR - DTO *************
class ProjectIsarModelToDbDtoConverter implements Converter<ProjectIsarModel, ProjectDbDto> {
  final TodoItemIsarModelToDbDtoConverter _converter;

  const ProjectIsarModelToDbDtoConverter(this._converter);

  @override
  ProjectDbDto convert(final ProjectIsarModel model) {
    final todoList = model.todoList.map((todo) => _converter.convert(todo)).toList(growable: true);
    return ProjectDbDto(id: model.id, title: model.title, todoList: todoList);
  }
}

class ProjectDbDtoToIsarModelConverter implements Converter<ProjectDbDto, ProjectIsarModel> {
  final TodoItemDbDtoToIsarModelConverter _converter;

  const ProjectDbDtoToIsarModelConverter(this._converter);

  @override
  ProjectIsarModel convert(final ProjectDbDto dto) {
    final todoList = dto.todoList.map((todo) => _converter.convert(todo)).toList(growable: true);
    return ProjectIsarModel(
      id: dto.id ?? DateTime.now().millisecondsSinceEpoch,
      title: dto.title,
      todoList: todoList,
    );
  }
}

/// ************ DTO - ENTITY *************
class ProjectDbDtoToEntityConverter implements Converter<ProjectDbDto, Project> {
  final TodoItemDbDtoToEntityConverter _converter;

  const ProjectDbDtoToEntityConverter(this._converter);

  @override
  Project convert(final ProjectDbDto dto) {
    final todos = dto.todoList.map((todo) => _converter.convert(todo)).toList(growable: true);
    return Project(id: dto.id, title: dto.title, todoList: todos);
  }
}

class ProjectEntityToDbDtoConverter implements Converter<Project, ProjectDbDto> {
  final TodoItemEntityToDbDtoConverter _converter;

  const ProjectEntityToDbDtoConverter(this._converter);

  @override
  ProjectDbDto convert(final Project entity) {
    final todos = entity.todoList.map((todo) => _converter.convert(todo)).toList(growable: true);
    return ProjectDbDto(id: entity.id, title: entity.title, todoList: todos);
  }
}
