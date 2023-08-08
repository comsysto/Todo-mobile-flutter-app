import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/features/todo/data/database/isar/model/project_isar_model.dart';

Future<Isar> initIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(schemas: [ProjectIsarModelSchema], directory: dir.path);
}
