import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/todo/data/converter/project_converter.dart';
import 'package:todo_app/features/todo/data/converter/todo_item_converter.dart';
import 'package:todo_app/features/todo/data/database/database_manager.dart';
import 'package:todo_app/features/todo/data/database/database_manager_impl.dart';
import 'package:todo_app/features/todo/data/database/isar_datasource.dart';
import 'package:todo_app/features/todo/data/repository/project_repository_impl.dart';
import 'package:todo_app/features/todo/data/repository/todo_repository_impl.dart';
import 'package:todo_app/features/todo/domain/repository/project_repository.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_app/features/todo/presentation/riverpod/test_provider.dart';

final isarDatasourceProvider = Provider<IsarDatasource>(
  (ref) => IsarDatasource(),
);

/// ************ MANAGERS *************
final databaseManagerProvider = FutureProvider<DatabaseManager>(
  (ref) async {
    final instance = ref.watch(isarDatasourceProvider);
    final db = await instance.init();
    return DatabaseManagerImpl(db);
  },
);

/// ************ CONVERTERS *************
final todoItemModelToEntityConverterProvider = Provider<TodoItemModelToEntityConverter>(
  (ref) => TodoItemModelToEntityConverter(),
);

final todoItemEntityToModelConverterProvider = Provider<TodoItemEntityToModelConverter>(
  (ref) => TodoItemEntityToModelConverter(),
);

final projectModelToEntityConverterProvider = Provider<ProjectModelToEntityConverter>(
  (ref) => ProjectModelToEntityConverter(ref.watch(todoItemModelToEntityConverterProvider)),
);

final projectEntityToModelConverterProvider = Provider<ProjectEntityToModelConverter>(
  (ref) => ProjectEntityToModelConverter(ref.watch(todoItemEntityToModelConverterProvider)),
);

/// ************ REPOSITORIES *************
final projectRepositoryProvider = Provider<ProjectRepository>(
  (ref) => ProjectRepositoryImpl(
    ref.watch(databaseManagerProvider).value!,
    ref.watch(projectModelToEntityConverterProvider),
    ref.watch(projectEntityToModelConverterProvider),
  ),
);

final todoRepositoryProvider = Provider<TodoRepository>(
  (ref) => TodoRepositoryImpl(
    ref.watch(databaseManagerProvider).value!,
    ref.watch(todoItemModelToEntityConverterProvider),
    ref.watch(todoItemEntityToModelConverterProvider),
  ),
);

/// ************ PROVIDERS *************
final testProvider = ChangeNotifierProvider<TestProvider>(
  (ref) => TestProvider(
    ref.watch(projectRepositoryProvider),
    ref.watch(todoRepositoryProvider),
  ),
);
