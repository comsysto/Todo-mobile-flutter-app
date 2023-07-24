import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/domain/usecase/create_new_project_use_case.dart';
import 'package:todo_app/features/todo/domain/usecase/get_all_projects_use_case.dart';

class ProjectProvider extends ChangeNotifier {
  final GetAllProjectsUseCase _getAllProjectsUseCase;
  final CreateNewProjectUseCase _createNewProjectUseCase;
  AsyncValue<List<Project>>? projectListState;
  Project? _selectedProject;

  ProjectProvider(this._getAllProjectsUseCase, this._createNewProjectUseCase) {
    getAllProjects();
  }

  Future<void> getAllProjects() async {
    projectListState = const AsyncValue.loading();
    notifyListeners();

    projectListState = await AsyncValue.guard(() => _getAllProjectsUseCase());
    notifyListeners();
  }

  void createNewProject(final String projectName) => _createNewProjectUseCase(projectName);

  void selectProject(final Project project) => _selectedProject = project;

  Project? get selectedProject => _selectedProject;
}
