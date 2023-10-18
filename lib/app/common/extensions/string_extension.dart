import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension StringExtension on String {


  Widget toSvg({double? height, double? width, Color? color,EdgeInsets? padding}) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SvgPicture.asset(
        this,
        height: height,
        width: width,
        color: color,
      ),
    );
  }

}