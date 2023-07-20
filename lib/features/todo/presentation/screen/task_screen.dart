import 'package:flutter/material.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
import 'package:todo_app/features/todo/presentation/widget/statistics_widget.dart';
import 'package:todo_app/features/todo/presentation/widget/task_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/profile.jpg'),
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      Text('Hello Phillip!', style: boldTextStyle),
                      Text('Software developer'),
                    ],
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Let\'s make habits together',
                style: titleTextStyle,
              ),
              const SizedBox(height: 30),
              const StatisticsWidget(),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Projects', style: titleTextStyle),
                  Text('See all', style: detailsTextStyle),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) => const Column(
                    children: [
                      TaskWidget(),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
