import 'package:flutter/material.dart';

/// Gidilmek istenilen ekran tanımlı değil ise Gösterilen ekran
class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(child: Text('Unknown Screen')),
    );
  }
}
