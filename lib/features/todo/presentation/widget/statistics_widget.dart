import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/common/presentation/style/text_styles.dart';

class StatisticsWidget extends ConsumerWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTodoState = ref.watch(
      projectProvider.select((provider) => provider.totalNumberOfCompletedTasks),
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).bannerTheme.backgroundColor!,
              Theme.of(context).bannerTheme.surfaceTintColor!,
            ],
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              AppLocalizations.of(context)!.statisticsCard,
              style: statisticsCardSmallTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              AppLocalizations.of(context)!.statisticsCardTitle,
              style: statisticsCardTitleTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              textBaseline: TextBaseline.ideographic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.statisticsCardSubtitle,
                  style: statisticsCardTextStyle,
                ),
                Text(
                  completedTodoState.asData!.value.toString(),
                  style: statisticsCardNumberTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
