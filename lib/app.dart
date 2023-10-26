import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/routing/routing_manager/routing_manager.dart';
import 'package:flutter_base_project/app/main/values/constants/http_url.dart';
import 'package:flutter_base_project/app/managers/app_managers/app_state/app_state_controller.dart';
import 'package:flutter_base_project/app/managers/app_managers/app_state/app_state_stream_builder.dart';
import 'package:flutter_base_project/app/data/local_models/config/environment_config_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_kit/overlay_kit.dart';

import 'app/managers/app_managers/size_config.dart';
import 'app/managers/locale_manager/locale_manager.dart';
import 'app/main/theme/color/app_colors.dart';
import 'app/main/theme/theme.dart';
import 'app/main/theme/themes/app_dark_theme.dart';
import 'app/main/i10n/default_localization.dart';
import 'app/main/i10n/i10n.dart';


Future run(EnvironmentConfigModel config) async{
  HttpUrl.baseUrl = config.apiBaseUrl;
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.cacheInit();

  runApp.call(config.app);
}

class App extends StatelessWidget {
  const App({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return OverlayKit(
      appPrimaryColor: AppColors.primary,
      child: MaterialRxStreamBuilder(
          stream: AppStateController.instance.outModel,
          builder: (_, snapshot) {
            final model = snapshot.data;
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                SizeConfig.setScreenSizeFromConstraints(constraints);
                return MaterialApp.router(
                  routerConfig: RoutingManager.instance.router,
                  locale: model!.locale,
                  supportedLocales: getSupportedLocalList,
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    AppLocalization.delegate
                  ],
                  builder: (BuildContext context, Widget? child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: child!,
                    );
                  },
                  scrollBehavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
                  title: title,
                  debugShowCheckedModeBanner: false,
                  theme: model.themeData,
                  darkTheme: getTheme(AppDarkTheme()),
                );
              },
            );
          }),
    );
  }
}
