import 'package:flutter/material.dart';

class GeneralLoadingView extends StatelessWidget {
  const GeneralLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
