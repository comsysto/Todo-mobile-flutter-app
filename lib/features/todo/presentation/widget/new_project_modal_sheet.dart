import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/widget/custom_button.dart';
import 'package:todo_app/features/common/presentation/widget/custom_text_field.dart';

class NewProjectModalSheet extends StatefulHookConsumerWidget {
  const NewProjectModalSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewProjectModalSheetState();
}

class _NewProjectModalSheetState extends ConsumerState<NewProjectModalSheet> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 550,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('New project', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: titleController,
                    labelText: 'Title',
                    validator: (value) => _validateTitle(value),
                  ),
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
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                          ),
                        ),
                      ),
                      CustomButton(
                        text: 'Create',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ref.read(projectProvider).createNewProject(titleController.text);
                            ref.read(projectProvider).getAllProjects();
                            Navigator.of(context).pop();
                          }
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

  String? _validateTitle(final String? value) {
    if (value == null || value.isEmpty) {
      print('Not good');
      return 'Task title cannot be empty';
    }
    print(value);
    return null;
  }
}
