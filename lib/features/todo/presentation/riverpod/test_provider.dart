import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';
import 'package:todo_app/features/todo/domain/usecase/complete_todo_use_case.dart';
import 'package:todo_app/features/todo/domain/usecase/create_new_project_use_case.dart';
import 'package:todo_app/features/todo/domain/usecase/create_new_todo_use_case.dart';
import 'package:todo_app/features/todo/domain/usecase/get_all_projects_use_case.dart';
import 'package:todo_app/features/todo/domain/usecase/get_todos_for_project_use_case.dart';

class TestProvider extends ChangeNotifier {
  final CreateNewProjectUseCase _createNewProjectUseCase;
  final CreateNewTodoUseCase _createNewTodoUseCase;
  final GetAllProjectsUseCase _getAllProjectsUseCase;
  final GetTodosForProjectUseCase _getTodosForProjectUseCase;
  final CompleteTodoUseCase _completeTodoUseCase;
  static int _projectCounter = 0;
  static int _todoCounter = 0;

  AsyncValue<List<Project>>? projectListState;
  AsyncValue<List<TodoItem>>? todoListState;

  TestProvider(
    this._createNewProjectUseCase,
    this._createNewTodoUseCase,
    this._getAllProjectsUseCase,
    this._getTodosForProjectUseCase,
    this._completeTodoUseCase,
  );

  Future<void> createNewProject() async {
    final projectName = 'Project #$_projectCounter';
    _projectCounter++;
    await _createNewProjectUseCase(projectName);
  }

  Future<void> getAllProjects() async {
    projectListState = const AsyncValue.loading();
    notifyListeners();

    projectListState = await AsyncValue.guard(() => _getAllProjectsUseCase());
    notifyListeners();
  }

  Future<void> createNewTodo() async {
    if (projectListState?.hasValue ?? false) {
      final todoName = 'Todo #$_todoCounter';
      _todoCounter++;
      final project = projectListState!.value!.first;
      await _createNewTodoUseCase(project.id!, todoName);
    }
  }

  Future<void> getAllTodosForProject(final int projectId) async {
    todoListState = const AsyncValue.loading();
    notifyListeners();

    todoListState = await AsyncValue.guard(() => _getTodosForProjectUseCase(projectId));
    notifyListeners();
  }

  Future<void> completeTodo() async {
    if ((todoListState?.hasValue ?? false) && todoListState!.value!.isNotEmpty) {
      final todo = todoListState!.value!.last;
      await _completeTodoUseCase(0, todo);
    }
  }
}
