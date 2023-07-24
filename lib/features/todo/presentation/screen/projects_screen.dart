import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/presentation/widget/statistics_widget.dart';
import 'package:todo_app/features/todo/presentation/widget/project_card.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectListState = ref.watch(
      projectProvider.select(
        (provider) => provider.projectListState,
      ),
    );

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
              projectListState!.when(
                data: (projectList) =>
                    projectList.isEmpty ? const NoProjects() : ProjectList(projects: projectList),
                error: (error, stackTrace) => Container(),
                loading: () => Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectList extends StatelessWidget {
  final List<Project> projects;

  const ProjectList({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (context, index) => Column(
          children: [
            ProjectCard(project: projects[index]),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class NoProjects extends StatelessWidget {
  const NoProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/everything_done.png'),
              width: 150,
            ),
            SizedBox(height: 10),
            Text('Everything done!', style: mediumTextStyle),
          ],
        ),
      ),
    );
  }
}
