import 'package:flutter_base_project/app/repositories/modules/auth_repository.dart';



class AppRepository {
  
  AppRepository._init();
  

  static final AppRepository _instance = AppRepository._init();

  static AppRepository get instance => _instance;

  
  final authRepository = AuthRepository();

}


