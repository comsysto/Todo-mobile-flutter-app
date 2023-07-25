import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/widget/custom_button.dart';
import 'package:todo_app/features/common/presentation/widget/custom_text_field.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/presentation/util/dialog_utils.dart';
import 'package:todo_app/features/todo/presentation/widget/date_time_text_field.dart';
import 'package:todo_app/features/todo/presentation/widget/new_project_modal_sheet.dart';
import 'package:todo_app/features/todo/presentation/widget/project_picker.dart';

class NewTodoScreen extends HookConsumerWidget {
  const NewTodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final dateController = useTextEditingController();
    final selectedDateTime = useState<DateTime?>(null);
    final selectedProject = useState<Project?>(null);

    final projectListState = ref.watch(
      projectProvider.select(
        (provider) => provider.projectListState,
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
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
              CustomTextField(
                controller: titleController,
                labelText: 'Title',
              ),
              const SizedBox(height: 15),
              DateTimeTextField(
                controller: dateController,
                onTap: () => _showDateTimePicker(context, selectedDateTime, dateController),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: ProjectPicker(
                      projectList: projectListState?.value! ?? <Project>[],
                      selectedProject: selectedProject.value,
                      onChanged: (project) => selectedProject.value = project,
                    ),
                  ),
                  TextButton(
                    onPressed: () => _openNewProjectModalSheet(context),
                    child: const Row(
                      children: [
                        Icon(Icons.add, color: primaryColor),
                        Text('New', style: detailsTextStyle),
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
                        style: mediumTextStyle.copyWith(color: redColor),
                      ),
                    ),
                  ),
                  CustomButton(
                    text: 'Create',
                    onPressed: () => _createTask(
                      context,
                      ref,
                      titleController.text,
                      selectedDateTime.value,
                      selectedProject.value!,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDateTimePicker(
    final BuildContext context,
    final ValueNotifier<DateTime?> selectedDateTime,
    final TextEditingController dateController,
  ) async {
    await DialogUtils.showDateTimePickerDialog(
      context: context,
      onCupertinoDateTimeChanged: (dateTime) => selectedDateTime.value = dateTime,
      onMaterialDateTimeChanged: (dateTime) => selectedDateTime.value = dateTime,
    );
    dateController.text = DateFormat('dd.MM.yyyy. HH:mm').format(selectedDateTime.value!);
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

  void _createTask(
    final BuildContext context,
    final WidgetRef ref,
    final String title,
    final DateTime? dueDate,
    final Project project,
  ) async {
    await ref.read(todoProvider(project.id!)).createNewTodo(project.id!, title, dueDate ?? DateTime.now());
    if (context.mounted) {
      _popToTaskScreen(context);
      ref.read(projectProvider).getAllProjects();
    }
  }
}
