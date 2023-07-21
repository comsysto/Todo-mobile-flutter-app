import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/features/todo/data/database/model/project_object.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_object.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProjectObjectAdapter());
  Hive.registerAdapter(TodoItemObjectAdapter());
}
