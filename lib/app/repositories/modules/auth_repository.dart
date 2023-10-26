import 'package:flutter_base_project/app/data/local_models/domain/session_header_model.dart';
import 'package:flutter_base_project/app/managers/session_manager/session_manager.dart';
import 'package:get/get.dart';

class AuthRepository extends SessionHeaderModel {
  AuthRepository() : super(token: Get.find<SessionManager>().getUserToken() ?? '');
}