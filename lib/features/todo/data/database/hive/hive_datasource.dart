import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/features/todo/data/database/hive/model/project_hive_model.dart';
import 'package:todo_app/features/todo/data/database/hive/model/todo_item_hive_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProjectHiveModelAdapter());
  Hive.registerAdapter(TodoItemHiveModelAdapter());
}
