import 'package:todo_app/features/todo/data/converter/todo_item_converter.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final DatabaseManager _databaseManager;
  final TodoItemModelToEntityConverter _todoItemModelToEntityConverter;
  final TodoItemEntityToModelConverter _todoItemEntityToModelConverter;

  const TodoRepositoryImpl(
    this._databaseManager,
    this._todoItemModelToEntityConverter,
    this._todoItemEntityToModelConverter,
  );

  @override
  Future<void> createNewTodo(final int projectId, final TodoItem todo) async {
    final todoModel = _todoItemEntityToModelConverter.convert(todo);
    _databaseManager.insertNewTodo(projectId, todoModel);
  }

  @override
  Future<List<TodoItem>> getAllTodosForProject(final int projectId) async {
    final todoModels = await _databaseManager.getAllTodosForProject(projectId);
    return todoModels.map((todo) => _todoItemModelToEntityConverter.convert(todo)).toList();
  }

  @override
  Future<void> removeTodo(final int projectId, final TodoItem todo) async {
    final todoModel = _todoItemEntityToModelConverter.convert(todo);
    _databaseManager.removeTodo(projectId, todoModel);
  }
}
