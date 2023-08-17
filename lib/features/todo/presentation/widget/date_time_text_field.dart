import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DateTimeTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  const DateTimeTextField({super.key, required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Theme.of(context).shadowColor,
      borderRadius: BorderRadius.circular(10),
      child: TextField(
        style: Theme.of(context).textTheme.bodyMedium,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: Theme.of(context).cardTheme.color,
          alignLabelWithHint: true,
          isDense: true,
          suffixIcon: const Icon(Icons.calendar_month_rounded),
          suffixIconColor: Theme.of(context).iconTheme.color,
          label: Text(
            AppLocalizations.of(context)!.dueDate,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).iconTheme.color,
                ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Theme.of(context).cardTheme.color!),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Theme.of(context).cardTheme.color!),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        readOnly: true,
        onTap: onTap,
      ),
    );
  }
}
