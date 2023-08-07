import 'package:todo_app/features/todo/data/converter/converter.dart';
import 'package:todo_app/features/todo/data/converter/todo_item_converter.dart';
import 'package:todo_app/features/todo/data/database/hive/model/project_hive_model.dart';
import 'package:todo_app/features/todo/data/database/model/project_db_dto.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';

/// ************ HIVE TO DTO *************
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

/// ************ ISAR TO DTO *************

/// ************ DTO TO ENTITY *************
class ProjectDbDtoToEntityConverter implements Converter<ProjectDbDto, Project> {
  final TodoItemDbDtoToEntityConverter _converter;

  const ProjectDbDtoToEntityConverter(this._converter);

  @override
  Project convert(final ProjectDbDto dto) {
    final todos = dto.todoList.map((todo) => _converter.convert(todo)).toList();
    return Project(id: dto.id, title: dto.title, todoList: todos);
  }
}

class ProjectEntityToDbDtoConverter implements Converter<Project, ProjectDbDto> {
  final TodoItemEntityToDbDtoConverter _converter;

  const ProjectEntityToDbDtoConverter(this._converter);

  @override
  ProjectDbDto convert(final Project entity) {
    final todos = entity.todoList.map((todo) => _converter.convert(todo)).toList();
    return ProjectDbDto(id: entity.id, title: entity.title, todoList: todos);
  }
}
