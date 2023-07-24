import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/todo/presentation/widget/todo_card.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProject = ref.watch(
      projectProvider.select((provider) => provider.selectedProject),
    );
    final todoListState = ref.watch(
      todoProvider(selectedProject!.id!).select((provider) => provider.todoListState),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: Text('Task list', style: boldTextStyle)),
              const SizedBox(height: 50),
              SizedBox(
                width: 250,
                child: Text(selectedProject.title, style: titleTextStyle),
              ),
              const SizedBox(height: 20),
              todoListState!.when(
                data: (todoList) => Expanded(
                  child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) => TodoCard(
                      projectId: selectedProject.id!,
                      todoItem: todoList[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(height: 15),
                    itemCount: todoList.length,
                  ),
                ),
                error: (error, _) => const Center(
                  child: Text(
                    'There was an error...',
                    style: mediumTextStyle,
                  ),
                ),
                loading: () => const CircularProgressIndicator.adaptive(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
