import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/routing/module/auth/auth_route.dart';
import 'package:go_router/go_router.dart';

import '../../../app/main/routing/module/test/test_route.dart';
import '../../test/common/test_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.pushNamed(AuthRoute.signUp),
              child: const Text('Sign Up Screen'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  context.pushNamed(TestRoute.firstTestScreen, extra: TestModel(testName: 'Alper', testId: '2')),
              child: const Text('Test Screen 1 '),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.pushNamed(TestRoute.secondTestScreen, pathParameters: {'userId': '999999'}),
              child: const Text('Test Screen 2'),
            ),
          ],
        ),
      ),
    );
  }
}
