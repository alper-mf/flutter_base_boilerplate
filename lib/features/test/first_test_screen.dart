import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/test/common/test_model.dart';

class FirstTestScreen extends StatefulWidget {
  final TestModel testModel;
  const FirstTestScreen({super.key, required this.testModel});

  @override
  State<FirstTestScreen> createState() => _FirstTestScreenState();
}

class _FirstTestScreenState extends State<FirstTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: Text('Test Screen ${widget.testModel.testName}', style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
