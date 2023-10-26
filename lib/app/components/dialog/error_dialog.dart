import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/extensions/widget_extension.dart';
import 'package:flutter_base_project/app/utils/size/padding_and_radius.dart';
import '../../main/i10n/i10n.dart';
import 'dialog_widget.dart';

class ErrorDialog<T> extends DialogWidget<T> {
  const ErrorDialog({
    Key? key,
    this.message,
    this.firstBtnText,
    this.secondBtnText,
    this.onTapFirstBtn,
    this.onTapSecondBtn,
    this.isSecondBtnVisible = true,
  }) : super(key: key);

  final String? message;
  final String? firstBtnText;
  final String? secondBtnText;
  final VoidCallback? onTapFirstBtn;
  final VoidCallback? onTapSecondBtn;
  final bool isSecondBtnVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.error,
          color: Theme.of(context).colorScheme.error,
        ),
        const SizedBox(height: paddingXXXS),
        Text(
          message ?? AppLocalization.getLabels.defaultErrorMessage,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: paddingXXXS),
          child: ElevatedButton(
              onPressed: onTapFirstBtn,
              child: Text(firstBtnText ?? AppLocalization.getLabels.tryAgainBtnText)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: paddingXXXS),
          child: OutlinedButton(
              onPressed: onTapSecondBtn ?? () => Navigator.pop(context),
              child: Text(secondBtnText ?? AppLocalization.getLabels.cancelBtnText)),
        ).isVisible(isSecondBtnVisible),
      ],
    );
  }
}
