import 'package:todo_app/features/todo/data/converter/converter.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_object.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';

class TodoItemObjectToEntityConverter implements Converter<TodoItemObject, TodoItem> {
  @override
  TodoItem convert(final TodoItemObject object) => TodoItem(
        id: object.id,
        title: object.title,
        dueDate: object.dueDate,
        isDone: object.isDone,
      );
}

class TodoItemEntityToObjectConverter implements Converter<TodoItem, TodoItemObject> {
  @override
  TodoItemObject convert(final TodoItem entity) => TodoItemObject(
        id: entity.id,
        title: entity.title,
        dueDate: entity.dueDate,
        isDone: entity.isDone,
      );
}
