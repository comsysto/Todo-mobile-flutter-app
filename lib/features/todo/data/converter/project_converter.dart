import 'package:todo_app/features/todo/data/converter/converter.dart';
import 'package:todo_app/features/todo/data/converter/todo_item_converter.dart';
import 'package:todo_app/features/todo/data/model/project_model.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';

class ProjectModelToEntityConverter implements Converter<ProjectModel, Project> {
  final TodoItemModelToEntityConverter _converter;

  const ProjectModelToEntityConverter(
    this._converter,
  );

  @override
  Project convert(final ProjectModel model) {
    final todoList = model.todoList.map((item) => _converter.convert(item)).toList();
    return Project(model.title, model.id, todoList);
  }
}

class ProjectEntityToModelConverter implements Converter<Project, ProjectModel> {
  final TodoItemEntityToModelConverter _converter;

  const ProjectEntityToModelConverter(this._converter);

  @override
  ProjectModel convert(Project entity) {
    final todoList = entity.todoList?.map((item) => _converter.convert(item)).toList() ?? [];
    return ProjectModel(entity.title, todoList);
  }
}
