import 'app.dart';
import 'app/main/values/enum/general_enum.dart';
import 'app/data/local_models/config/environment_config_model.dart';


/// flutter run --flavor product lib/app/main/main_production.dart
/// flutter build apk --release --flavor product lib/app/main/main_production.dart
/// flutter build appbundle --release --flavor product lib/app/main/main_production.dart

void main() {
  run(
    EnvironmentConfigModel(
      app:const App(title: 'ClaudePeak Boilerplate'),
      environment: AppEnvironment.Production,
      apiBaseUrl: 'Base Url',
      socketUrl: 'Socket Url',
    ),
  );
}

