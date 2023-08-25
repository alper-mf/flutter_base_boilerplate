import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/routing/module/auth/auth_route.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('OnBoarding Screen'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.goNamed(AuthRoute.auth),
              child: const Text('Go to Auth'),
            ),
          ],
        ),
      ),
    );
  }
}
