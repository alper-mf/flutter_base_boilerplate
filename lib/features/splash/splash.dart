import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/utils/size_config.dart';
import 'package:flutter_base_project/app/main/routing/module/auth/auth_route.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Splash Screen'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.goNamed(AuthRoute.signIn),
              child: const Text('Go to Auth'),
            ),
          ],
        ),
      ),
    );
  }
}
