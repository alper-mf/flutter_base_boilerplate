import 'package:go_router/go_router.dart';

import '../../../../features/test/common/test_model.dart';
import '../../../../features/test/first_test_screen.dart';
import '../../../../features/test/seconde_test_screen.dart';

class TestRoute {
  TestRoute._();

  static const String firstTestScreen = '/first-test-screen';
  static const String secondTestScreen = '/second-test-screen';

  static final route = [
    GoRoute(
      name: firstTestScreen,
      path: '/first_test_screen',
      builder: (context, state) {
        final testModel = state.extra as TestModel;
        return FirstTestScreen(testModel: testModel);
      },
    ),
    GoRoute(
      name: secondTestScreen,
      path: '/second_test_screen/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId'];
        return SecondTestScreen(testId: userId!);
      },
    ),
  ];
}
