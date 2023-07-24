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
          ? _showCupertinoDialog(context, onCupertinoDateTimeChanged)
          : _showMaterialDialog(context, onMaterialDateTimeChanged);

  static Future<void> _showCupertinoDialog(
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

  static Future<void> _showMaterialDialog(
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
}
