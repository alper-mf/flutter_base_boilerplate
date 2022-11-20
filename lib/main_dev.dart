import 'app.dart';
import 'app/data/local_models/config/environment_config_model.dart';
import 'app/main/values/constants/app_constant.dart';
import 'app/main/values/enums/general_enum.dart';

/// Development ortamı
///
/// COMMAND LINE örneği
/// flutter run --flavor development lib/main_development.dart
/// flutter build apk --flavor development lib/main_development.dart
void main() {
  run(
    EnvironmentConfigModel(
      appName: appName + AppEnvironment.Development.name,
      environment: AppEnvironment.Development,
      apiBaseUrl: 'your dev api url', // exp : 'api.test.com'
      socketUrl: 'your websocket adress', // exp: 'wss://socket.test.com/'
      lokiUrl: '',
    ),
  );
}
