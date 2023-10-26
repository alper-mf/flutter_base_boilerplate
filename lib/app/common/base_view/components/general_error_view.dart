import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/extensions/widget_extension.dart';
import '../../../main/i10n/i10n.dart';
import '../../../utils/size/padding_and_radius.dart';

class GeneralErrorView extends StatelessWidget {
  final String? message;
  final String? btnText;
  final VoidCallback? onTapTryAgain;
  const GeneralErrorView({
    super.key,
    this.message,
    this.onTapTryAgain,
    this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: paddingXXXS),
          Text(message ?? AppLocalization.getLabels.defaultErrorMessage, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: paddingXXXS),
          SizedBox(height: 56, child: ElevatedButton(onPressed: onTapTryAgain, child: Text(btnText ?? AppLocalization.getLabels.tryAgainBtnText))).isVisible(onTapTryAgain!=null),
        ],
      ),
    );
  }
}
