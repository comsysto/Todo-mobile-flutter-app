import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';

class TodoCard extends HookConsumerWidget {
  final int projectId;
  final TodoItem todoItem;

  const TodoCard({super.key, required this.projectId, required this.todoItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkState = useState(todoItem.isDone);

    useEffect(() {
      checkState.value = todoItem.isDone;
      return null;
    }, [todoItem]);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: foregroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10,
            color: shadowColor,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            todoItem.title,
            style: formTextSyle.copyWith(
              decoration: checkState.value ? TextDecoration.lineThrough : null,
            ),
          ),
          Checkbox.adaptive(
            value: checkState.value,
            onChanged: (newValue) {
              checkState.value = newValue!;
              _completeTodo(ref);
            },
          ),
        ],
      ),
    );
  }

  void _completeTodo(final WidgetRef ref) async {
    await Future.delayed(const Duration(seconds: 1));
    todoItem.isDone = true;
    await ref.read(todoProvider(projectId)).completeTodo(projectId, todoItem);
    await ref.read(projectProvider).getAllProjects();
  }
}
