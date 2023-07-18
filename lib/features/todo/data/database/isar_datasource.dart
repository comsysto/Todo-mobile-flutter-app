import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/features/todo/data/database/model/project_model.dart';
import 'package:todo_app/features/todo/data/database/model/todo_item_model.dart';

class IsarDatasource {
  late Directory dir;
  late Isar instance;

  void init() async {
    dir = await getApplicationDocumentsDirectory();
    instance = await Isar.open([ProjectModelSchema], directory: dir.path);
    instance = await Isar.open([TodoItemModelSchema], directory: dir.path); 
    //MUST BE CollectionSchema, look tutorial for this
  }
}
