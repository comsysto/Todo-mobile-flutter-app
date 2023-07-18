import 'package:flutter/material.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
      child:  const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Statistics', style: statisticsCardSmallTextStyle,),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20,10,20,0),
            child: Text('This month', style: statisticsCardTitleTextStyle),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20,0,20,10),
            child: Row(
              textBaseline: TextBaseline.ideographic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tasks completed', style: statisticsCardTextStyle),
                Text('13', style: statisticsCardNumberTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
