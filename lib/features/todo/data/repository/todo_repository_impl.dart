import 'package:todo_app/features/todo/data/converter/todo_item_converter.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final DatabaseManager _databaseManager;
  final TodoItemDbDtoToEntityConverter _dbDtoToEntityConverter;
  final TodoItemEntityToDbDtoConverter _entityToDbDtoConverter;

  const TodoRepositoryImpl(
    this._databaseManager,
    this._dbDtoToEntityConverter,
    this._entityToDbDtoConverter,
  );

  @override
  Future<void> createNewTodo(final int projectId, final TodoItem todo) async {
    final todoDto = _entityToDbDtoConverter.convert(todo);
    await _databaseManager.insertNewTodo(projectId, todoDto);
  }

  @override
  Future<List<TodoItem>> getAllTodosForProject(final int projectId) async {
    final todoDtos = await _databaseManager.getAllTodosForProject(projectId);
    return todoDtos.map((object) => _dbDtoToEntityConverter.convert(object)).toList();
  }

  @override
  Future<void> completeTodo(final int projectId, final TodoItem todo) async {
    final todoDto = _entityToDbDtoConverter.convert(todo);
    await _databaseManager.completeTodo(projectId, todoDto);
  }
}
