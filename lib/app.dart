// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_base_project/app/main/values/constants/http_url.dart';
import 'package:flutter_base_project/app/managers/material_controller/rx_stream_builder.dart';
import 'package:get_it/get_it.dart';

import 'app/data/local_models/config/environment_config_model.dart';

import 'app/main/localizations/i10n/default_localization.dart';
import 'app/main/localizations/i10n/i10n.dart';
import 'app/main/routing/module/auth/auth_manager.dart';
import 'app/main/routing/screen_manager.dart';
import 'app/main/theme/color_schemes.g.dart';
import 'app/main/values/constants/app_constant.dart' as cons;
import 'app/managers/locale_manager/locale_manager.dart';
import 'app/managers/material_controller/material_controller.dart';

/// Tüm proje ortamları bu run Fon. nunu çağırmakta
Future run(EnvironmentConfigModel config) async {
  WidgetsFlutterBinding.ensureInitialized();
  MaterialAppController.instance;

  await LocaleManager.cacheInit();

  /// Initialize your AuthManager
  GetIt.I.registerSingleton<AuthManager>(AuthManager());
  MaterialAppController.instance.initTheme(ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      ThemeData(useMaterial3: true, colorScheme: lightColorScheme));

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
    return MaterialRxStreamBuilder(
        stream: MaterialAppController.instance.outModel,
        builder: (_, snapshot) {
          final model = snapshot.data;
          return MaterialApp.router(
            scrollBehavior: MyCustomScrollBehavior(),
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child!,
              );
            },
            routerConfig: Screens.instance.router,
            locale: model!.locale,
            supportedLocales: getSupportedLocalList,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalization.delegate,
            ],
            darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
            title: appName ?? cons.appName,
            // theme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
            theme: model.themeData,
          );
        });
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
