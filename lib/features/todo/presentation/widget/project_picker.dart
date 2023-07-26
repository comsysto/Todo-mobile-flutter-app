import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
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
      dropdownColor: foregroundColor,
      style: formTextSyle.copyWith(color: Colors.black),
      isDense: true,
      elevation: 6,
      value: selectedProject,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: foregroundColor,
        alignLabelWithHint: true,
        isDense: true,
        suffixIconColor: labelColor,
        label: Text(
          'Choose project',
          style: formTextSyle.copyWith(color: labelColor),
        ),
        border: DecoratedInputBorder(
          shadow: const BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: Offset(1, 5),
          ),
          child: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: foregroundColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        enabledBorder: DecoratedInputBorder(
          shadow: const BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: Offset(1, 5),
          ),
          child: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: foregroundColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        focusedBorder: DecoratedInputBorder(
          shadow: const BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: Offset(1, 5),
          ),
          child: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: foregroundColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        errorBorder: DecoratedInputBorder(
          shadow: const BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: Offset(1, 5),
          ),
          child: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: redColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        errorStyle: errorTextStyle,
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
