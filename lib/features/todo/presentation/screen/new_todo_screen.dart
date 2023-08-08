import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/widget/custom_button.dart';
import 'package:todo_app/features/common/presentation/widget/custom_text_field.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/presentation/util/dialog_utils.dart';
import 'package:todo_app/features/todo/presentation/widget/date_time_text_field.dart';
import 'package:todo_app/features/todo/presentation/widget/new_project_modal_sheet.dart';
import 'package:todo_app/features/todo/presentation/widget/project_picker.dart';

class NewTodoScreen extends StatefulHookConsumerWidget {
  const NewTodoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends ConsumerState<NewTodoScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final dateController = useTextEditingController();
    final selectedDateTime = useState<DateTime?>(null);
    final selectedProject = useState<Project?>(null);

    final projectListState = ref.watch(
      projectProvider.select(
        (provider) => provider.projectListState,
      ),
    );

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text('New task', style: Theme.of(context).textTheme.titleSmall)),
                  const SizedBox(height: 50),
                  Text('New challange to\ncomplete', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: titleController,
                    labelText: 'Title',
                    validator: (value) => _validateTitle(value),
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
                          projectList: projectListState?.value ?? <Project>[],
                          selectedProject: selectedProject.value,
                          onChanged: (project) => selectedProject.value = project,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          _openNewProjectModalSheet(context);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.add, color: Theme.of(context).colorScheme.secondary),
                            Text('New', style: Theme.of(context).textTheme.displaySmall),
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
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                          ),
                        ),
                      ),
                      CustomButton(
                        text: 'Create',
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          _createTask(
                            context,
                            ref,
                            titleController.text,
                            selectedDateTime.value,
                            selectedProject.value,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Project name cannot be empty';
    }
    return null;
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
      builder: (_) => const NewProjectModalSheet(),
    );
  }

  void _popToTaskScreen(final BuildContext context) => Navigator.pop(context);

  void _createTask(
    final BuildContext context,
    final WidgetRef ref,
    final String title,
    final DateTime? dueDate,
    final Project? project,
  ) async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(todoProvider(project!.id!))
          .createNewTodo(project.id!, title, dueDate ?? DateTime.now());
      if (context.mounted) {
        _popToTaskScreen(context);
        await ref.read(projectProvider).getAllProjects();
      }
    }
  }
}
