import 'package:todo_app/features/todo/data/database/model/project_object.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_object.dart';

abstract class DatabaseManager {
  Future<List<ProjectObject>> getAllProjects();
  Future<ProjectObject> getProjectById(int projectId);
  Future<void> insertNewProject(ProjectObject project);
  Future<void> removeProjectById(int id);

  Future<List<TodoItemObject>> getAllTodosForProject(int projectId);
  Future<void> insertNewTodo(int projectId, TodoItemObject todo);
  Future<void> completeTodo(int projectId, TodoItemObject todo);
}
