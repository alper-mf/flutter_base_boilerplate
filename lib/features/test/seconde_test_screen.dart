import 'package:flutter/material.dart';

class SecondTestScreen extends StatefulWidget {
  final String testId;
  const SecondTestScreen({super.key, required this.testId});

  @override
  State<SecondTestScreen> createState() => _SecondTestScreenState();
}

class _SecondTestScreenState extends State<SecondTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Second Test Screen'),
      ),
      body: Center(
        child: Text(widget.testId, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
