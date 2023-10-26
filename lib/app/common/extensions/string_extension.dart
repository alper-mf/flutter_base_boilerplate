import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringExtension on String {
  
  Future<void> launchLink() async {
    try {
      final Uri url = Uri.parse(this);
      await launchUrl(url);
    } catch (e) {
      debugPrint(e.toString());
    }
  }


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
