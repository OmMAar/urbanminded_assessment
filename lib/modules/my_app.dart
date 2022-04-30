import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/managers/localization/generated/l10n.dart';
import '../core/constants/app_theme.dart';
import '../core/di/di.dart';
import '../core/managers/managers.dart';
import '../core/utils/utl_app.dart';
import 'spalsh/ui/pages/splash_page.dart';

class MyApp extends StatefulWidget {
  final AppLanguage? appLanguage;

  const MyApp({Key? key, this.appLanguage}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
        ),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AppLanguage()),
          ],
          child: ChangeNotifierProvider<AppLanguage?>(
            create: (_) => widget.appLanguage,
            child: Consumer<AppLanguage>(builder: (context, model, child) {
              appUtils.setLang(model.appLocal.languageCode);
              return MaterialApp(
                builder: (context, widget) => ResponsiveWrapper.builder(
                  ClampingScrollWrapper.builder(context, widget!),
                  breakpoints: const [
                    ResponsiveBreakpoint.resize(350, name: MOBILE),
                    ResponsiveBreakpoint.autoScale(600, name: TABLET),
                    ResponsiveBreakpoint.resize(800, name: DESKTOP),
                    ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
                  ],
                ),
                locale: model.appLocal,
                debugShowCheckedModeBanner: false,
                title: AppStrings.appName,
                theme: themeData,
                onGenerateRoute: Routes.onGenerateRoute,
                navigatorKey: navigator.navigatorKey,
                home: const SplashPage(),
                localizationsDelegates: const [
                  // 1
                  Translations.delegate,
                  // 2
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: Translations.delegate.supportedLocales,
              );
            }),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
