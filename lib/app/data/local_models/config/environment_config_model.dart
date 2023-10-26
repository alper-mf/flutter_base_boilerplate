import 'package:flutter_base_project/app.dart';

import '../../../main/values/enum/general_enum.dart';


class EnvironmentConfigModel {
  EnvironmentConfigModel({
    required this.app,
    required this.environment,
    required this.apiBaseUrl,
    required this.socketUrl,
  });

  final AppEnvironment environment;
  final App app;
  final String apiBaseUrl;
  final String socketUrl;
}
