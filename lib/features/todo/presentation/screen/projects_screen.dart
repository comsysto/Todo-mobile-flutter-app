import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/todo/domain/entity/project.dart';
import 'package:todo_app/features/todo/presentation/widget/project_card.dart';
import 'package:todo_app/features/todo/presentation/widget/statistics_widget.dart';

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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  Column(
                    children: [
                      Text('Hello Phillip!', style: Theme.of(context).textTheme.titleSmall),
                      Text('Software engineer', style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Let\'s make habits together today',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 30),
              const StatisticsWidget(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Projects', style: Theme.of(context).textTheme.titleLarge),
                  Text('See all', style: Theme.of(context).textTheme.displaySmall),
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
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (_, index) => ProjectCard(project: projects[index]),
        separatorBuilder: (context, _) => const SizedBox(height: 15),
      ),
    );
  }
}

class NoProjects extends StatelessWidget {
  const NoProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/everything_done.png'),
              width: 150,
            ),
            const SizedBox(height: 10),
            Text('Everything done!', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
