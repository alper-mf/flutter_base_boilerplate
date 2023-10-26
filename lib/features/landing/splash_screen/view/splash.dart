import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/base_view/base_view.dart';
import 'package:flutter_base_project/app/common/extensions/widgets_scale_extension.dart';
import '../../../../app/utils/size/padding_and_radius.dart';
import '../controller/splash_controller.dart';

class Splash extends StatelessWidget {

  const Splash({
    super.key,
    required this.controller,
  });
  final SplashController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BaseView(
        controller: controller,
        loadingView: Center(
        child: Column(
          children: [
            const Spacer(),
            FlutterLogo(size: 196.horizontalScale),
            const SizedBox(height: paddingXXXL),
            const CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              color: Colors.white,
            ),
            const Spacer(),
          ],
        ),
      ),
        child: SizedBox.shrink(),
      ),
      
    );
  }
}
