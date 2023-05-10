import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/routing/screen_manager.dart';
import 'package:go_router/go_router.dart';

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
              onPressed: () => context.pushNamed(Screens.firstTestScreenPath,
                  extra: TestModel(testName: 'Alperr', testId: '2').toJson()),
              child: const Text('Test Screen 1 '),
            ),
            ElevatedButton(
              onPressed: () => context.pushNamed(Screens.secondTestScreenPath, pathParameters: {'userId': '999999'}),
              child: const Text('Test Screen 2'),
            ),
          ],
        ),
      ),
    );
  }
}
