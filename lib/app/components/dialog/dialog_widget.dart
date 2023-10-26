import 'package:flutter/material.dart';
import '../../common/extensions/widget_extension.dart';

abstract class DialogWidget<T> extends StatelessWidget {

  const DialogWidget({super.key, this.padding});
  final EdgeInsets? padding;

  Future<T?> show({bool? barrierDismissible}) => openSimpleDialog<T>(
        padding: padding,
        barrierDismissible: barrierDismissible,
      );

  @override
  Widget build(BuildContext context);
}
