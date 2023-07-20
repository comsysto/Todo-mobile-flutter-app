import 'package:todo_app/features/todo/data/converter/converter.dart';
import 'package:todo_app/features/todo/data/model/todo_item_model.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';

class TodoItemModelToEntityConverter implements Converter<TodoItemModel, TodoItem> {
  @override
  TodoItem convert(final TodoItemModel model) {
    return TodoItem(
      model.title,
      model.description,
      model.dueDate,
    );
  }
}

class TodoItemEntityToModelConverter implements Converter<TodoItem, TodoItemModel> {
  @override
  TodoItemModel convert(final TodoItem entity) {
    return TodoItemModel()
      ..title = entity.title
      ..description = entity.description
      ..dueDate = entity.dueDate;
  }
}
