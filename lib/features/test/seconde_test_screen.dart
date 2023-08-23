import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/utils/text_style.dart';

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
        child: SizedBox(
          height: 200,
          width: 300,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(widget.testId,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
            ),
          ),
        ),
      ),
    );
  }
}
