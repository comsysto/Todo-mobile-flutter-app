import 'package:todo_app/features/todo/data/model/project_model.dart';
import 'package:todo_app/features/todo/data/model/todo_item_model.dart';

abstract class DatabaseManager {
  Future<List<ProjectModel>> getAllProjects();
  Future<void> insertNewProject(ProjectModel project);
  Future<void> removeProjectById(int id);
  Future<void> updateProject(ProjectModel project);

  Future<List<TodoItemModel>> getAllTodosForProject(int projectId);
  Future<void> insertNewTodo(int projectId, TodoItemModel todo);
  Future<void> removeTodo(int projectId, TodoItemModel todo);
}