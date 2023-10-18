
import 'package:flutter/material.dart';

extension TextEditingControllerExtension on TextEditingController {


  void setValue(String? value){
    text = value ?? '';
  }

}