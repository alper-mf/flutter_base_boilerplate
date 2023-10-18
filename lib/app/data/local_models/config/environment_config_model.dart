import '../../../main/values/enums/general_enum.dart';

/// Environment ler için yazılan model
/// Ortamlara ayırmak istediğimiz tüm ayarları bu nodelle yazıyoruz
///
/// [environment] Ortam 'Environment'
/// [sentryUrl] Loki log url
///
class EnvironmentConfigModel {
  EnvironmentConfigModel({
    this.appName,
    required this.environment,
    required this.apiBaseUrl,
    required this.socketUrl,
    required this.sentryUrl,
  });

  final String? appName;
  final AppEnvironment environment;
  final String apiBaseUrl;
  final String socketUrl;
  final String sentryUrl;
}
