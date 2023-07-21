import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/widget/custom_button.dart';
import 'package:todo_app/features/common/presentation/widget/custom_text_field.dart';

class NewProjectModalSheet extends HookConsumerWidget {
  const NewProjectModalSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 550,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text('New task', style: boldTextStyle),
                const SizedBox(height: 20),
                CustomTextField(controller: titleController, labelText: 'Title'),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: descriptionController,
                  labelText: 'Short description',
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Cancel',
                          style: mediumTextStyle.copyWith(color: const Color(0xFFDE0000)),
                        ),
                      ),
                    ),
                    CustomButton(
                      text: 'Create',
                      onPressed: () {
                        ref.read(projectProvider).createNewProject(titleController.text);
                        ref.read(projectProvider).getAllProjects();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
