import 'package:flutter/material.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';

class ProjectPicker extends StatefulWidget {
  final List<Project> projectList;
  const ProjectPicker({super.key, required this.projectList});

  @override
  State<ProjectPicker> createState() => _ProjectPickerState();
}

class _ProjectPickerState extends State<ProjectPicker> {
  Project? _selectedProject;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
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
        isExpanded: true,
        underline: const SizedBox(),
        value: _selectedProject,
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
        onChanged: (value) => setState(() => _selectedProject = value!),
        items: widget.projectList.map<DropdownMenuItem<Project>>((project) {
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
