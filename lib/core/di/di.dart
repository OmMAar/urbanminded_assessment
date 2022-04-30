import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:urbanminded_assessment/core/managers/navigation/app_navigator.dart';

import 'di.config.dart';


final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async {
  await $initGetIt(getIt);
}
Dep findDep<Dep extends Object>({String? instanceName}) {
  if (instanceName?.isNotEmpty ?? false) getIt<Dep>(instanceName: instanceName);
  return getIt<Dep>();
}
AppNavigator get navigator {
  return findDep<AppNavigator>();
}