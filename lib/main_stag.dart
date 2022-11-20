import 'app.dart';
import 'app/data/local_models/config/environment_config_model.dart';
import 'app/main/values/constants/app_constant.dart';
import 'app/main/values/enums/general_enum.dart';

void main() {
  run(
    EnvironmentConfigModel(
      appName: appName + AppEnvironment.Development.name,
      environment: AppEnvironment.Development,
      apiBaseUrl: 'your stag api url', // exp : 'api.test.com'
      socketUrl: 'your websocket adress', // exp: 'wss://socket.test.com/'
      lokiUrl: '',
    ),
  );
}
