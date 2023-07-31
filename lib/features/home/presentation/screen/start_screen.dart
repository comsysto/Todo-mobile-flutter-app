import 'package:flutter/material.dart';
import 'package:todo_app/core/route_generator.dart';
import 'package:todo_app/features/common/presentation/style/colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).bannerTheme.surfaceTintColor!,
              Theme.of(context).bannerTheme.backgroundColor!,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Image(
                  image: AssetImage('assets/images/start_screen_image.png'),
                ),
                const SizedBox(height: 100),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      height: 200,
                      child: Center(
                        child: Text(
                          'Manage your\nprojects with Protaly',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -40,
                      left: 50,
                      right: 50,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                        child: IconButton(
                          color: foregroundColorLight,
                          onPressed: () => _redirectToHomeScreen(context),
                          icon: const Icon(Icons.chevron_right_rounded),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _redirectToHomeScreen(final BuildContext context) =>
      Navigator.of(context).pushReplacementNamed(RouteGenerator.homeScreen);
}
