import 'package:flutter_base_project/app/data/local_models/config/environment_config_model.dart';

import 'app.dart';
import 'app/main/values/enum/general_enum.dart';

/// Development ortamı
///
/// COMMAND LINE örneği
/// flutter run --flavor development lib/app/main/main_development.dart
/// flutter build appbundle --release --flavor development lib/app/main/main_development.dart
void main() {
  run(
    EnvironmentConfigModel(
      app:const App(title: 'ClaudePeak Boilerplate Dev'),
      environment: AppEnvironment.Development,
      apiBaseUrl: 'Base Url',
      socketUrl: 'Socket Url',
    ),
  );
}
 