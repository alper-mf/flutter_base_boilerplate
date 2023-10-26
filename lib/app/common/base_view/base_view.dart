import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/base_view/components/general_loading_view.dart';
import 'package:flutter_base_project/app/common/base_view/controller/base_controller.dart';
import 'package:flutter_base_project/app/common/extensions/general_extension.dart';
import 'package:get/get.dart';
import '../../main/i10n/i10n.dart';
import 'components/general_error_view.dart';

class BaseView<T extends BaseControllerInterface> extends StatelessWidget {
  final VoidCallback? onTapTryAgain;
  final Widget child;
  final Widget? loadingView;
  final Widget? errorView;
  final T controller;

  const BaseView({
    super.key, 
    required this.controller,
    required this.child,
    this.onTapTryAgain, 
    this.loadingView,
    this.errorView,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.loadingStatus.isError
          ? (errorView ?? GeneralErrorView(
              message: controller.errorMessage ?? AppLocalization.getLabels.defaultErrorMessage,
              onTapTryAgain: onTapTryAgain ?? controller.onReady,
            ))
          : (controller.loadingStatus.isLoaded || controller.loadingStatus.isProcessing)
              ?  child
              : loadingView ??  GeneralLoadingView();
    });
  }
}