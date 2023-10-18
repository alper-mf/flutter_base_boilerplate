import 'app.dart';
import 'app/data/local_models/config/environment_config_model.dart';
import 'app/main/values/constants/app_constant.dart';
import 'app/main/values/enums/general_enum.dart';

/// Production ortamı
///
/// COMMAND LINE örneği
/// flutter run --flavor product lib/main_prod.dart
/// flutter build apk --release --flavor product lib/main_prod.dart
void main() {
  run(
    EnvironmentConfigModel(
      appName: appName + AppEnvironment.Development.name,
      environment: AppEnvironment.Development,
      apiBaseUrl: 'your prod api url', // exp : 'api.test.com'
      socketUrl: 'your websocket adress', // exp: 'wss://socket.test.com/'
      sentryUrl: '',
    ),
  );
}
