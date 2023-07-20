import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';
import 'package:todo_app/features/todo/domain/repository/project_repository.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

class TestProvider extends ChangeNotifier {
  final ProjectRepository _projectRepository;
  final TodoRepository _todoRepository;
  static int _projectCounter = 0;
  static int _todoCounter = 0;

  AsyncValue<List<Project>>? projectListState;
  AsyncValue<List<TodoItem>>? todoListState;

  TestProvider(
    this._projectRepository,
    this._todoRepository,
  );

  Future<void> createNewProject() async {
    _projectCounter++;
    final project = Project('Project #$_projectCounter');
    await _projectRepository.createNewProject(project);
    print('CREATED PROJECT!');
  }

  Future<void> getAllProjects() async {
    projectListState = const AsyncValue.loading();
    notifyListeners();

    projectListState = await AsyncValue.guard(() => _projectRepository.getAllProjects());
    notifyListeners();

    if (projectListState!.hasValue) {
      projectListState!.value!.forEach((project) => print(project));
    }
  }

  Future<void> createNewTodo() async {
    _todoCounter++;
    final todo = TodoItem('Task #$_todoCounter', 'Random description', DateTime.now());
    await _todoRepository.createNewTodo(1, todo);
    print('CREATED TODO');
  }

  Future<void> getAllTodosForProject(final int projectId) async {
    todoListState = const AsyncValue.loading();
    notifyListeners();

    todoListState = await AsyncValue.guard(() => _todoRepository.getAllTodosForProject(projectId));
    notifyListeners();

    if (todoListState!.hasValue) {
      todoListState!.value!.forEach((todo) => print(todo));
    }
  }

  Future<void> completeTodo(
    final String title,
    final String description,
    final DateTime dueDate,
    final int projectId,
  ) async {
    final todo = TodoItem(title, description, dueDate);
    await _todoRepository.removeTodo(projectId, todo);
    print('COMPLETED TODO');
  }
}
