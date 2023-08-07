import 'package:todo_app/features/todo/data/converter/converter.dart';
import 'package:todo_app/features/todo/data/database/hive/model/todo_item_hive_model.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_db_dto.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';

/// ************ HIVE TO DTO *************
class TodoItemHiveModelToDbDtoConverter implements Converter<TodoItemHiveModel, TodoItemDbDto> {
  @override
  TodoItemDbDto convert(final TodoItemHiveModel model) => TodoItemDbDto(
        id: model.id,
        title: model.title,
        dueDate: model.dueDate,
        isDone: model.isDone,
      );
}

class TodoItemDbDtoToHiveModelConverter implements Converter<TodoItemDbDto, TodoItemHiveModel> {
  @override
  TodoItemHiveModel convert(final TodoItemDbDto dto) => TodoItemHiveModel(
        id: dto.id,
        title: dto.title,
        dueDate: dto.dueDate,
        isDone: dto.isDone,
      );
}

/// ************ ISAR TO DTO *************

/// ************ DTO TO ENTITY *************
class TodoItemDbDtoToEntityConverter implements Converter<TodoItemDbDto, TodoItem> {
  @override
  TodoItem convert(final TodoItemDbDto dto) => TodoItem(
        id: dto.id,
        title: dto.title,
        dueDate: dto.dueDate,
        isDone: dto.isDone,
      );
}

class TodoItemEntityToDbDtoConverter implements Converter<TodoItem, TodoItemDbDto> {
  @override
  TodoItemDbDto convert(final TodoItem entity) => TodoItemDbDto(
        id: entity.id,
        title: entity.title,
        dueDate: entity.dueDate,
        isDone: entity.isDone,
      );
}
