import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DateWidget(date: DateTime.now()),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mobile developement', style: mediumTextStyle),
              Text('University College Algebra', style: detailsTextStyle),
            ],
          ),
          IconButton(
            onPressed: () => _showTaskDetailsDialog(context),
            icon: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }

  void _showTaskDetailsDialog(final BuildContext context) {
    print('Show dialog with details');
  }
}

class DateWidget extends StatelessWidget {
  final DateTime date;

  const DateWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFFEFEFEF),
      radius: 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(DateFormat('MMM').format(date), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
          Text(DateFormat('dd').format(date), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}
