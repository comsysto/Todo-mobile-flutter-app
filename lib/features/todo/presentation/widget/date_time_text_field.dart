import 'package:flutter/material.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';

class DateTimeTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  const DateTimeTextField({super.key, required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: shadowColor,
      borderRadius: BorderRadius.circular(10),
      child: TextField(
        style: formTextSyle,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: foregroundColor,
          alignLabelWithHint: true,
          isDense: true,
          suffixIcon: const Icon(Icons.calendar_month_rounded),
          suffixIconColor: labelColor,
          label: Text(
            'Due date',
            style: formTextSyle.copyWith(color: labelColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: foregroundColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: foregroundColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        readOnly: true,
        onTap: onTap,
      ),
    );
  }
}
