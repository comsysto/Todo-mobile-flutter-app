import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
import 'package:todo_app/features/common/presentation/widget/custom_button.dart';
import 'package:todo_app/features/common/presentation/widget/custom_text_field.dart';
import 'package:todo_app/features/todo/presentation/widget/new_project_modal_sheet.dart';

class NewTaskScreen extends HookConsumerWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final dateController = useTextEditingController();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: Text('New task', style: boldTextStyle)),
              const SizedBox(height: 50),
              const Text('New challange to\ncomplete', style: titleTextStyle),
              const SizedBox(height: 30),
              CustomTextField(controller: titleController, labelText: 'Title'),
              const SizedBox(height: 15),
              CustomTextField(
                controller: dateController,
                labelText: 'Due date',
                suffixIcon: const Icon(Icons.event_rounded, size: 26),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: dateController,
                      labelText: 'Project',
                    ),
                  ),
                  TextButton(
                    onPressed: () => _openNewProjectModalSheet(context),
                    child: const Row(
                      children: [
                        Icon(Icons.add, color: primaryColor),
                        Text('New project', style: detailsTextStyle),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    child: TextButton(
                      onPressed: () => _popToTaskScreen(context),
                      child: Text(
                        'Cancel',
                        style: mediumTextStyle.copyWith(color: const Color(0xFFDE0000)),
                      ),
                    ),
                  ),
                  CustomButton(
                    text: 'Create',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openNewProjectModalSheet(final BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (final BuildContext context) => const NewProjectModalSheet(),
    );
  }

  void _popToTaskScreen(final BuildContext context) => Navigator.pop(context);
}
