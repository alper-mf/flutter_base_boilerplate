import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/extensions/string_extension.dart';
import 'package:flutter_base_project/app/main/routing/routing_manager/routing_manager.dart';
import 'package:flutter_base_project/app/main/values/assets/assets.dart';
import 'package:overlay_kit/overlay_kit.dart';

import '../../utils/size/padding_and_radius.dart';
import '../../utils/style/text_style.dart';
import '../../common/extensions/widgets_scale_extension.dart';
import '../../main/theme/color/app_colors.dart';


void _showToastMessage({
  required Widget widget,
  int? duration,
}) {
  OverlayToastMessage.show(
    widget: widget,
    dismissAll: true,
    duration: Duration(seconds: duration ?? 2),
  );
}

void showDoneToastMessage(String text, {int? duration}) {
  _showToastMessage(
    duration: duration,
    widget: _ToastWidget(
      textMessage: text,
      backgroundColor: AppColors.green.shade200,
      primaryColor: AppColors.green.shade800,
      svgStr: circleDoneIcon,
    ),
  );
}

void showWarningToastMessage(String text, {int? duration}) {
  _showToastMessage(
    duration: duration,
    widget: _ToastWidget(
      textMessage: text,
      backgroundColor: const Color(0xffFFFCF2),
      primaryColor: const Color(0xffFDB022),
      svgStr: warningIcon,
    ),
  );
}

void showErrorToastMessage(String text, {int? duration}) {
  _showToastMessage(
    duration: duration,
    widget: _ToastWidget(
      textMessage: text,
      backgroundColor: const Color(0xffFFF9F9),
      primaryColor: Theme.of(RoutingManager.instance.context!).colorScheme.error,
      svgStr: errorIcon,
    ),
  );
}

class _ToastWidget extends StatelessWidget {

  const _ToastWidget({
    required this.textMessage,
    required this.backgroundColor,
    required this.primaryColor,
    required this.svgStr,
  });
  final String textMessage;
  final Color backgroundColor;
  final Color primaryColor;
  final String svgStr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingM),
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: primaryColor,
            width: 1.horizontalScale,
          ),
          borderRadius: BorderRadius.circular(radiusXXS),
        ),
        child: Padding(
          padding: EdgeInsets.all(paddingXXS.horizontalScale),
          child: Row(
            children: [
              Container(
                height: 40.verticalScale,
                width: 4.horizontalScale,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(radiusXXXXXXS),
                ),
              ),
              const SizedBox(width: paddingXXS),
              svgStr.toSvg(width: 24.horizontalScale),
              const SizedBox(width: paddingM),
              Flexible(
                child: Text(
                  textMessage,
                  maxLines: 2,
                  style: s16W500Dark,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
