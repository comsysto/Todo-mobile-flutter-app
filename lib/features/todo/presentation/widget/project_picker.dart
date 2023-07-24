import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
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
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: foregroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10,
            color: Colors.black12,
          ),
        ],
      ),
      child: DropdownButton<Project>(
        dropdownColor: foregroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        isExpanded: true,
        underline: const SizedBox(),
        value: selectedProject,
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Text(
            'Choose project',
            style: formTextSyle.copyWith(color: labelColor),
          ),
        ),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 36,
        iconEnabledColor: labelColor,
        elevation: 10,
        style: formTextSyle.copyWith(color: Colors.black),
        onChanged: onChanged,
        items: projectList.map<DropdownMenuItem<Project>>((project) {
          return DropdownMenuItem<Project>(
            value: project,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Text(project.title),
            ),
          );
        }).toList(),
      ),
    );
  }
}
