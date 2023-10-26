import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/routing/routing_manager/routing_manager.dart';

import '../../utils/size/padding_and_radius.dart';


extension WidgetExtension on Widget {
  
  Widget isVisible(bool value, {double? height, double? width}) =>
      value ? this : SizedBox(height: height, width: width);

  Widget isFiltered(bool value, ColorFilter colorFilter) =>
      value ? ColorFiltered(colorFilter: colorFilter, child: this) : this;

  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);

  Future<T?> openDialog<T>({BuildContext? context, bool? barrierDismissible, Color? barrierColor}) {
    return showDialog<T>(
      barrierDismissible: barrierDismissible ?? true,
      barrierColor: barrierColor ?? Colors.black45,
      context: context ?? RoutingManager.instance.context!,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  Future<T?> openSimpleDialog<T>({
    BuildContext? context,
    Color? barrierColor,
    bool? barrierDismissible,
    EdgeInsetsGeometry? padding,
  }) {
    return Dialog(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(paddingXL),
        child: this,
      ),
    ).openDialog<T>(context: context, barrierColor: barrierColor, barrierDismissible: barrierDismissible);
  }

  Future<T?> openBottomSheet<T>({
    BuildContext? context,
    Color? barrierColor,
    Color? backgroundColor,
    bool? barrierDismissible,
    ShapeBorder? shape,
    BoxConstraints? constraints,
    bool? isScrollControlled,
    bool? useRootNavigator,
    bool? isDismissible,
    bool? enableDrag,
  }) {
    return showModalBottomSheet<T>(
      context: context ?? RoutingManager.instance.context!,
      barrierColor: barrierColor,
      backgroundColor: backgroundColor,
      isScrollControlled: isScrollControlled ?? false,
      useRootNavigator: useRootNavigator ?? false,
      isDismissible: isDismissible ?? true,
      enableDrag: enableDrag ?? true,
      shape: shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(radiusXXL),
            ),
          ),
      constraints: constraints,
      builder: (BuildContext context) {
        return this;
      },
    );
  }
}
