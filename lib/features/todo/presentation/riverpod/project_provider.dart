import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/usecase/create_new_project_use_case.dart';
import 'package:todo_app/features/todo/domain/usecase/delete_project_use_case.dart';
import 'package:todo_app/features/todo/domain/usecase/get_all_projects_use_case.dart';
import 'package:todo_app/features/todo/domain/usecase/get_completed_task_number_use_case.dart';

class ProjectProvider extends ChangeNotifier {
  final GetAllProjectsUseCase _getAllProjectsUseCase;
  final CreateNewProjectUseCase _createNewProjectUseCase;
  final GetCompletedTodoNumberUseCase _getCompletedTodoNumberUseCase;
  final DeleteProjectUseCase _deleteProjectUseCase;

  AsyncValue<List<Project>>? projectListState;
  AsyncValue<int> totalNumberOfCompletedTasks = const AsyncValue.data(0);
  Project? _selectedProject;

  ProjectProvider(
    this._getAllProjectsUseCase,
    this._createNewProjectUseCase,
    this._getCompletedTodoNumberUseCase,
    this._deleteProjectUseCase,
  ) {
    getAllProjects();
    getTotalNumberOfCompletedTasks();
  }

  Future<void> getAllProjects() async {
    projectListState = const AsyncValue.loading();
    notifyListeners();

    projectListState = await AsyncValue.guard(() => _getAllProjectsUseCase());
    notifyListeners();
  }

  Future<void> getTotalNumberOfCompletedTasks() async {
    totalNumberOfCompletedTasks = AsyncValue.data(await _getCompletedTodoNumberUseCase());
    notifyListeners();
  }

  void createNewProject(final String projectName) => _createNewProjectUseCase(projectName);

  Future<void> deleteProject(final Project project) => _deleteProjectUseCase(project);

  void selectProject(final Project project) => _selectedProject = project;

  Project? get selectedProject => _selectedProject;
}
