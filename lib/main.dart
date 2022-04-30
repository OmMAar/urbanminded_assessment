import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urbanminded_assessment/core/utils/utils.dart';
import 'core/di/di.dart';
import 'core/managers/managers.dart';
import 'modules/my_app.dart';



Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {

    WidgetsFlutterBinding.ensureInitialized();

    await setPreferredOrientations();

    await configureInjection();

    AppLanguage appLanguage = AppLanguage();

    await appLanguage.fetchLocale();

    runApp(MyApp(appLanguage: appLanguage));

  }, (error, stack) {
    /// todo : add  FirebaseCrashlytics
    appPrint("Main App Crash Error:${error.toString()} - Stack: $stack");
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
