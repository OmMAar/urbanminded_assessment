import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/managers/managers.dart';
import 'package:urbanminded_assessment/modules/home/ui/pages/home_page.dart';
import 'package:urbanminded_assessment/modules/spalsh/ui/pages/splash_page.dart';


class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';

  /// main pages
  static const String home = '/home';



  static Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments as BaseNavigationArg?;
    NavigationType type = NavigationType.scale;
    if (args?.navigationType != null) type = args!.navigationType!;
    if (settings.name == '/unKnowRoute') return null;
    return PageRouteBuilder(
      reverseTransitionDuration: const Duration(
        milliseconds: AppAnimationDuration.shimmerAnimationDuration,
      ),
      transitionDuration: const Duration(
        milliseconds: AppAnimationDuration.shimmerAnimationDuration,
      ),
      pageBuilder: (c, a1, a2) {
        return getPage(settings, args?.data, a1, a2);
      },
      settings: settings,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        if (type == NavigationType.fade) {
          return FadeThroughTransition(
            animation: animation,
            fillColor: AppColors.primaryColor,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        }
        if (type == NavigationType.fadeScale) {
          return FadeScaleTransition(
            animation: animation,
            child: child,
          );
        }
        if (type == NavigationType.slideHorizontal) {
          return SharedAxisTransition(
            animation: animation,
            fillColor: AppColors.primaryColor,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        }
        if (type == NavigationType.slideVertical) {
          return SharedAxisTransition(
            animation: animation,
            fillColor: AppColors.primaryColor,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
            child: child,
          );
        }

        /// Scale Just
        return SharedAxisTransition(
          animation: animation,
          fillColor: AppColors.primaryColor,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          child: child,
        );
      },
    );
  }

  static Widget getPage(
    RouteSettings settings,
    Object? argument,
    Animation<double> a1,
    Animation<double> a2,
  ) {
    switch (settings.name) {
      case splash:
        return const SplashPage();
        case home:
        return const HomePage();

    }

    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}
