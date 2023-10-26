import 'package:flutter_base_project/app/main/values/constants/app_constant.dart';
import '../../managers/app_managers/size_config.dart';


extension WidgetsScale on num {
  double get horizontalScale => this * (SizeConfig.screenWidth / designScreenWidth);

  double get verticalScale => this * (SizeConfig.screenHeight / designScreenHeight);
}
