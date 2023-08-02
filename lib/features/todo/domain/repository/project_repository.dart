import 'package:todo_app/features/todo/domain/entity/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> getAllProjects();
  Future<Project> getProjectById(int projectId);
  Future<void> createNewProject(Project project);
  Future<void> removeProject(Project project);
}