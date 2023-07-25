import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
import 'package:todo_app/di.dart';

class StatisticsWidget extends ConsumerWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTodoState = ref.watch(
      projectProvider.select((provider) => provider.totalNumberOfCompletedTasks),
    );

    return Container(
      width: double.infinity,
      decoration:  BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [primaryColor, secondaryColor],
        ),
        borderRadius: BorderRadius.circular(20)
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Statistics', style: statisticsCardSmallTextStyle,),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Active projects', style: statisticsCardTitleTextStyle),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,10),
            child: Row(
              textBaseline: TextBaseline.ideographic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tasks completed', style: statisticsCardTextStyle),
                Text(completedTodoState.asData!.value.toString(), style: statisticsCardNumberTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
