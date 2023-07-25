import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/data/database/model/project_object.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_object.dart';

class DatabaseManagerImpl implements DatabaseManager {
  static const projectsBox = 'projects';

  @override
  Future<List<ProjectObject>> getAllProjects() async {
    final projects = await Hive.openBox<ProjectObject>(projectsBox);
    return projects.values.toList();
  }

  @override
  Future<List<TodoItemObject>> getAllTodosForProject(final int projectId) async {
    final projects = await Hive.openBox<ProjectObject>(projectsBox);
    return projects.get(projectId)?.todoList ?? [];
  }

  @override
  Future<void> insertNewProject(final ProjectObject project) async {
    final projects = await Hive.openBox<ProjectObject>(projectsBox);
    await projects.add(project);
  }

  @override
  Future<void> insertNewTodo(final int projectId, final TodoItemObject todo) async {
    final projects = await Hive.openBox<ProjectObject>(projectsBox);
    final project = projects.get(projectId);
    
    if (project != null) {
      todo.id = DateTime.now().millisecondsSinceEpoch;
      project.todoList.add(todo);
      await project.save();
    }
  }

  @override
  Future<void> removeProjectById(final int projectId) async {
    final projects = await Hive.openBox<ProjectObject>(projectsBox);
    await projects.delete(projectId);
  }

  @override
  Future<void> completeTodo(final int projectId, final TodoItemObject todoToComplete) async {
    final projects = await Hive.openBox<ProjectObject>(projectsBox);
    final project = projects.get(projectId);

    if (project != null) {
      final index = project.todoList.indexWhere((todo) => todo.id == todoToComplete.id);
      project.todoList[index].isDone = true;
      await project.save();
    }
  }
}
