import 'package:flutter/material.dart';

import '../../common/utils/padding_and_radius_size.dart';

import '../../main/localizations/i10n/i10n.dart';
import 'dialog_widget.dart';

class ErrorDialog<T> extends DialogWidget<T> {
  const ErrorDialog({
    Key? key,
    this.message,
    this.firstBtnText,
    this.secondBtnText,
    this.onTapFirstBtn,
    this.onTapSecondBtn,
  }) : super(key: key);

  final String? message;
  final String? firstBtnText;
  final String? secondBtnText;
  final VoidCallback? onTapFirstBtn;
  final VoidCallback? onTapSecondBtn;

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
        const SizedBox(height: paddingXS),
        Text(
          message ?? AppLocalization.getLabels.defaultErrorMessage,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: paddingXS),
          child: ElevatedButton(onPressed: onTapFirstBtn, child: Text(firstBtnText ?? 'Try Again')),
        ),
        Padding(
          padding: const EdgeInsets.only(top: paddingXS),
          child: OutlinedButton(
              onPressed: onTapSecondBtn ?? () => Navigator.pop(context), child: Text(secondBtnText ?? 'Back')),
        ),
      ],
    );
  }
}
