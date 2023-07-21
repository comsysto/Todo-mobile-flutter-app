import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/data/database/model/project_object.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_object.dart';

class DatabaseManagerImpl implements DatabaseManager{
  static const projectsBox = 'projects';

  @override
  Future<List<ProjectObject>> getAllProjects() async {
    final projects = await Hive.openBox<ProjectObject>(projectsBox);
    final projectList = projects.values.toList();
    print('=========================');
    print('PROJECT LIST:');
    projectList.forEach((project) => print(project));
    print('=========================');
    return projectList;
  }

  @override
  Future<List<TodoItemObject>> getAllTodosForProject(final int projectId) async {
    final projects = await Hive.openBox<ProjectObject>(projectsBox);
    final list = projects.get(projectId)?.todoList ?? [];
    print('=========================');
    print('TASK LIST FOR PROJECT WITH ID $projectId:');
    list.forEach((todo) => print(todo));
    print('=========================');
    return list;
  }

  @override
  Future<void> insertNewProject(final ProjectObject project) async {
    final projects = await Hive.openBox<ProjectObject>(projectsBox);
    print('ABOUT TO ADD NEW PROJECT');
    await projects.add(project);
    //await projects.put(project.id, project);
    print('NEW PROJECT ADDED');
  }

  @override
  Future<void> insertNewTodo(final int projectId, final TodoItemObject todo) async {
    final projects = await Hive.openBox<ProjectObject>(projectsBox);
    final project = projects.get(projectId);
    print('ABOUT TO ADD NEW TASK');
    if (project != null) {
      project.todoList.add(todo);
      await projects.put(projectId, project);
    }
    print('NEW TASK ADDED');
  }

  @override
  Future<void> removeProjectById(final int projectId) async {
    final projects = await Hive.openBox<ProjectObject>(projectsBox);
    print('ABOUT TO REMOVE PROJECT WITH ID $projectId');
    await projects.delete(projectId);
    print('PROJECT REMOVED');
  }

  @override
  Future<void> removeTodo(final int projectId, final TodoItemObject todoToDelete) async {
    final projects = await Hive.openBox<ProjectObject>(projectsBox);
    print('ABOUT TO REMOVE TODO');
    projects.get(projectId)?.todoList.removeWhere((todo) => todo.id == todoToDelete.id);
    print('TODO REMOVED');
  }
}
