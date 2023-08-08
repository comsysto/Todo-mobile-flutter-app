import 'package:todo_app/features/todo/data/database/model/project_db_dto.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_db_dto.dart';

abstract class DatabaseManager {
  Future<List<ProjectDbDto>> getAllProjects();
  Future<ProjectDbDto> getProjectById(int projectId);
  Future<void> insertNewProject(ProjectDbDto project);
  Future<void> removeProjectById(int projectId);

  Future<List<TodoItemDbDto>> getAllTodosForProject(int projectId);
  Future<void> insertNewTodo(int projectId, TodoItemDbDto todo);
  Future<void> completeTodo(int projectId, TodoItemDbDto todo);
}
