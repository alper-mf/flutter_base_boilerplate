// ignore_for_file: unnecessary_this

import '../../main/values/constants/app_constant.dart';
import '../utils/size_config.dart';

/// [horizontalScale] Font size ları ölçeklendirmek için kullanılmakta
extension WidgetsScale on num {
  double get horizontalScale => (SizeConfig.width == 0) ? this.toDouble() : this * (SizeConfig.width / designWith);
  double get verticalScale => (SizeConfig.height == 0) ? this.toDouble() : this * (SizeConfig.height / designHeight);
}
