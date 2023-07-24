import 'package:todo_app/features/todo/data/converter/todo_item_converter.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final DatabaseManager _databaseManager;
  final TodoItemObjectToEntityConverter _objectToEntityConverter;
  final TodoItemEntityToObjectConverter _entityToObjectConverter;

  const TodoRepositoryImpl(
    this._databaseManager,
    this._objectToEntityConverter,
    this._entityToObjectConverter,
  );

  @override
  Future<void> createNewTodo(final int projectId, final TodoItem todo) async {
    final todoObject = _entityToObjectConverter.convert(todo);
    _databaseManager.insertNewTodo(projectId, todoObject);
  }

  @override
  Future<List<TodoItem>> getAllTodosForProject(final int projectId) async {
    final todoObjects = await _databaseManager.getAllTodosForProject(projectId);
    return todoObjects.map((object) => _objectToEntityConverter.convert(object)).toList();
  }

  @override
  Future<void> removeTodo(final int projectId, final TodoItem todo) async {
    final todoObject = _entityToObjectConverter.convert(todo);
    _databaseManager.removeTodo(projectId, todoObject);
  }
}
