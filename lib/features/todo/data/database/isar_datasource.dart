import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/features/todo/data/model/project_model.dart';

class IsarDatasource {
  late Directory _dir;
  late Isar _instance;

  Future<Isar> init() async {
    if (Isar.instanceNames.isEmpty) {
      _dir = await getApplicationDocumentsDirectory();
      _instance = await Isar.open([ProjectModelSchema], inspector: true, directory: _dir.path);
    }
    return _instance;
  }
}
