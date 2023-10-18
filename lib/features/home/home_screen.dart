import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/utils/size_config.dart';
import 'package:flutter_base_project/features/home/view/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const HomeView();
  }
}
