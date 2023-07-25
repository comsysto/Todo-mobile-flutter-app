import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static Future<void> showDateTimePickerDialog({
    required final BuildContext context,
    required final Function(DateTime) onCupertinoDateTimeChanged,
    required final Function(DateTime) onMaterialDateTimeChanged,
  }) async =>
      Platform.isIOS
          ? _showCupertinoDateTimeDialog(context, onCupertinoDateTimeChanged)
          : _showMaterialDateTimeDialog(context, onMaterialDateTimeChanged);

  static Future<void> _showCupertinoDateTimeDialog(
    final BuildContext context,
    final Function(DateTime) onDateTimeChanged,
  ) async =>
      await showCupertinoModalPopup<DateTime>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              minimumDate: DateTime.now().subtract(const Duration(seconds: 1)),
              maximumDate: DateTime(2030),
              use24hFormat: true,
              onDateTimeChanged: onDateTimeChanged,
            ),
          ),
        ),
      );

  static Future<void> _showMaterialDateTimeDialog(
    final BuildContext context,
    final Function(DateTime) onMaterialDateTimeChanged,
  ) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null && context.mounted) {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate),
      );
      if (timeOfDay != null) {
        onMaterialDateTimeChanged(
          DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            timeOfDay.hour,
            timeOfDay.minute,
          ),
        );
      }
    }
  }

  static Future<bool> showConfirmationDialog({
    required final BuildContext context,
    required final String title,
    required final String content,
  }) =>
      Platform.isIOS
          ? _showCupertinoConfirmationDialog(context, title, content)
          : _showMaterialConfirmationDialog(context, title, content);

  static Future<bool> _showCupertinoConfirmationDialog(
    final BuildContext context,
    final String title,
    final String content,
  ) async =>
      await showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(false),
                isDefaultAction: false,
                isDestructiveAction: false,
                child: const Text('Cancel'),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(true),
                isDefaultAction: true,
                isDestructiveAction: true,
                child: const Text('Yes'),
              ),
            ],
          );
        },
      );

  static Future<bool> _showMaterialConfirmationDialog(
    final BuildContext context,
    final String title,
    final String content,
  ) async =>
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      );
}
