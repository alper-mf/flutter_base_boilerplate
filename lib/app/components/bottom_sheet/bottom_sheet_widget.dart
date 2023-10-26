import 'package:flutter/material.dart';
import '../../common/extensions/widget_extension.dart';

abstract class BottomSheetWidget<T> extends StatelessWidget {

  const BottomSheetWidget({
    super.key,
    this.barrierColor,
    this.barrierDismissible,
    this.shape,
    this.constraints,
    this.isScrollControlled,
    this.useRootNavigator,
    this.isDismissible,
    this.enableDrag,
    this.backgroundColor,
  });
  final Color? barrierColor;
  final Color? backgroundColor;
  final bool? barrierDismissible;
  final ShapeBorder? shape;
  final BoxConstraints? constraints;
  final bool? isScrollControlled;
  final bool? useRootNavigator;
  final bool? isDismissible;
  final bool? enableDrag;

  Future<T?> showBottomSheet({BuildContext? context}) => openBottomSheet(
        context: context,
        barrierColor: barrierColor,
        backgroundColor: backgroundColor,
        barrierDismissible: barrierDismissible,
        shape: shape,
        constraints: constraints,
        isScrollControlled: isScrollControlled,
        useRootNavigator: useRootNavigator,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
      );

  @override
  Widget build(BuildContext context);
}
