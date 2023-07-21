import 'package:todo_app/features/todo/data/converter/converter.dart';
import 'package:todo_app/features/todo/data/converter/todo_item_converter.dart';
import 'package:todo_app/features/todo/data/database/model/project_object.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';

class ProjectObjectToEntityConverter implements Converter<ProjectObject, Project> {
  final TodoItemObjectToEntityConverter _converter;

  const ProjectObjectToEntityConverter(this._converter);

  @override
  Project convert(final ProjectObject object) {
    final todos = object.todoList.map((todo) => _converter.convert(todo)).toList();
    return Project(id: object.key, title: object.title, todoList: todos);
  }
}

class ProjectEntityToObjectConverter implements Converter<Project, ProjectObject> {
  final TodoItemEntityToObjectConverter _converter;

  const ProjectEntityToObjectConverter(this._converter);

  @override
  ProjectObject convert(final Project entity) {
    final todos = entity.todoList.map((todo) => _converter.convert(todo)).toList();
    return ProjectObject(title: entity.title, todoList: todos);
  }
}
