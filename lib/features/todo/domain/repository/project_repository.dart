import 'package:todo_app/features/todo/domain/entity/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> getAllProjects();
  Future<void> createNewProject(Project project);
  Future<void> updateProject(Project project);
  Future<void> removeProject(Project project);
}