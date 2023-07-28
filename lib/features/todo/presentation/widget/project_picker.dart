import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/common/presentation/style/colors.dart';
import 'package:todo_app/features/common/presentation/style/theme.dart';
import 'package:todo_app/features/common/presentation/widget/custom_text_field.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';

class ProjectPicker extends HookConsumerWidget {
  final List<Project> projectList;
  final Project? selectedProject;
  final Function(Project?) onChanged;

  const ProjectPicker({
    super.key,
    required this.projectList,
    required this.onChanged,
    required this.selectedProject,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<Project>(
      borderRadius: BorderRadius.circular(10),
      dropdownColor: Theme.of(context).cardTheme.color,
      style: Theme.of(context).textTheme.bodyMedium,
      isDense: true,
      elevation: 6,
      value: selectedProject,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: Theme.of(context).cardTheme.color,
        alignLabelWithHint: true,
        isDense: true,
        suffixIconColor: Theme.of(context).iconTheme.color,
        label: Text(
          'Choose project',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Theme.of(context).iconTheme.color,
              ),
        ),
        border: DecoratedInputBorder(
          shadow: BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 10,
            offset: const Offset(1, 5),
          ),
          child: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Theme.of(context).cardTheme.color!),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        enabledBorder: DecoratedInputBorder(
          shadow: BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 10,
            offset: const Offset(1, 5),
          ),
          child: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Theme.of(context).cardTheme.color!),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        focusedBorder: DecoratedInputBorder(
          shadow: BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 10,
            offset: const Offset(1, 5),
          ),
          child: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Theme.of(context).cardTheme.color!),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        errorBorder: DecoratedInputBorder(
          shadow: BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 10,
            offset: const Offset(1, 5),
          ),
          child: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: redColorLight),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        errorStyle: Theme.of(context).textTheme.error,
      ),
      validator: _validateProject,
      items: projectList.map<DropdownMenuItem<Project>>(
        (project) {
          return DropdownMenuItem(
            value: project,
            child: Text(project.title),
          );
        },
      ).toList(),
      onChanged: onChanged,
    );
  }

  String? _validateProject(value) {
    if (value == null) {
      return 'Please select a project';
    }
    return null;
  }
}
