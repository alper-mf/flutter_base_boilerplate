// ignore: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_base_project/app/main/theme/themes.dart';
import 'package:flutter_base_project/app/main/values/constants/http_url.dart';
import 'package:flutter_base_project/app/managers/material_controller/rx_stream_builder.dart';

import 'app/data/local_models/config/environment_config_model.dart';
import 'app/main/localizations/default_localization.dart';
import 'app/main/localizations/i10n.dart';
import 'app/main/routing/screen_manager.dart';
import 'app/main/values/constants/app_constant.dart' as cons;
import 'app/managers/locale_manager/locale_manager.dart';
import 'app/managers/material_controller/material_controller.dart';

/// Tüm proje ortamları bu run Fon. nunu çağırmakta
Future run(EnvironmentConfigModel config) async {
  WidgetsFlutterBinding.ensureInitialized();
  MaterialAppController.instance;

  await LocaleManager.cacheInit();

  ///Initialize your HTTP base url and Web Socket Adress
  HttpUrl.baseUrl = config.apiBaseUrl;
  HttpUrl.webSocketAdress = config.socketUrl;

  debugPrint('HttpUrl.baseUrl: ${HttpUrl.baseUrl} \n Http.socketUrl: ${HttpUrl.webSocketAdress}');
  runApp(MyApp(appName: config.appName));
}

class MyApp extends StatelessWidget {
  final String? appName;
  const MyApp({Key? key, this.appName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialAppController.instance.initTheme(AppThemes().darkTheme, AppThemes().lightTheme);
    return MaterialRxStreamBuilder(
        stream: MaterialAppController.instance.outModel,
        builder: (_, snapshot) {
          final model = snapshot.data;
          return MaterialApp(
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child!,
              );
            },
            locale: model!.locale,
            supportedLocales: getSupportedLocalList,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalization.delegate,
            ],
            title: appName ?? cons.appName,
            theme: model.themeData,
            onGenerateRoute: Screens.instance.main.onGenerateRoute,
          );
        });
  }
}
