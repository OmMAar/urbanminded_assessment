import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../utils/utils.dart';
@LazySingleton()
class AppNavigator {
  AppNavigator();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  Future<T?> pushNamed<T>(String routeName, {dynamic arguments}) {
    DeviceUtils.hideKeyboard(_navigatorKey.currentContext!);
    return _navigatorKey.currentState!
        .pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T>(String routeName, {dynamic arguments}) {
    DeviceUtils.hideKeyboard(_navigatorKey.currentContext!);
    return _navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(String routeName, {Object? arguments}) {
    DeviceUtils.hideKeyboard(_navigatorKey.currentContext!);
    return _navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void pop<T>([T? result]) {
    DeviceUtils.hideKeyboard(_navigatorKey.currentContext!);
    return _navigatorKey.currentState!.pop(result);
  }

  bool canPop() {
    return _navigatorKey.currentState!.canPop();
  }

  Future<T?> offAll<T>(String routeName, {dynamic arguments, T? result}) {
    DeviceUtils.hideKeyboard(_navigatorKey.currentContext!);
    return _navigatorKey.currentState!.pushNamedAndRemoveUntil<T>(
      routeName,
      (route) => false,
    );
  }

  void pushNamedIfNotCurrent(
    String routeName, {
    Object? arguments,
  }) {
    if (!isCurrent(routeName)) {
      pushNamed(routeName, arguments: arguments);
    }
  }

  void pushReplacementNamedIfNotCurrent(
    String routeName, {
    Object? arguments,
  }) {
    if (!isCurrent(routeName)) {
      pushReplacementNamed(routeName, arguments: arguments,);
    }
  }

  bool isCurrent(String routeName) {
    bool isCurrent = false;
    _navigatorKey.currentState!.popUntil((route) {
      if (route.settings.name == routeName) {
        isCurrent = true;
      }
      return true;
    });
    return isCurrent;
  }

  Future? goRoot() {
    /// TODO
    return null;
  }

  Future? goLogin() {
    /// TODO
    return null;
  }
}
