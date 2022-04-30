import 'dart:convert';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:urbanminded_assessment/core/constants/app_enums.dart';
import '../constants/constants.dart';

/// todo - remove it before launching
void appPrint(dynamic value) {
  if (kDebugMode) {
    print(
        '==================================[TAG]==================================');
    print('$value');
    print(
        '=========================================================================');
  }
}

class AppUtils {
  // UtlApp._();

  static bool notNullOrEmpty(String? value) {
    return value != null && value.isNotEmpty;
  }

  String _lang = AppStrings.LANG_EN;

  void setLang(String? lang) {
    if (notNullOrEmpty(lang)) _lang = lang!;

    appPrint('---------------------Lang--------------:$_lang');
  }

  /// language helper without context
  String getLang() {
    if (_lang == AppStrings.LANG_AR) return AppStrings.LANG_AR;
    return AppStrings.LANG_EN;
  }

  static Future<dynamic> parseFileAssetToJson(
      {required String assetFile}) async {
    String jsonData = await rootBundle.loadString(assetFile);
    return json.decode(jsonData);
  }

  static String numberFormat(double number) {
    return NumberFormat.decimalPattern().format(number);
  }


  static String strDependOnPlatform({String? androidStr, String? iosStr}) {
    if (defaultTargetPlatform == TargetPlatform.iOS && notNullOrEmpty(iosStr)) {
      return iosStr!;
    } else if (defaultTargetPlatform == TargetPlatform.android &&
        notNullOrEmpty(androidStr)) {
      return androidStr!;
    }
    return "";
  }

  static void funDependOnPlatform(
      {VoidCallback? androidFun, VoidCallback? iosFun, VoidCallback? webFun}) {
    if (defaultTargetPlatform == TargetPlatform.iOS && iosFun != null) {
      iosFun();
    } else if (defaultTargetPlatform == TargetPlatform.android &&
        androidFun != null) {
      androidFun();
    } else if (kIsWeb && webFun != null) {
      webFun();
    }
  }

  static String platformStr() {
    if (kIsWeb) {
      return PlatformTargetApp.Web.name;
    } else {
      if (Platform.isAndroid) {
        return PlatformTargetApp.Android.name;
      } else if (Platform.isIOS) {
        return PlatformTargetApp.iOS.name;
      } else if (Platform.isLinux) {
        return PlatformTargetApp.Linux.name;
      } else if (Platform.isMacOS) {
        return PlatformTargetApp.MacOs.name;
      } else if (Platform.isWindows) {
        return PlatformTargetApp.Windows.name;
      } else {
        return "";
      }
    }
  }

  static String bytesToHex(List<int> bytes) {
    return bytes.map((e) => e.toRadixString(16).padLeft(2, '0')).join('');
  }

  static showToast(
      {required String msg,
      Toast? toastLength,
      Color? backgroundColor,
      Color? textColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: AppTextSize.small);
  }

  static showDialog<T>({required BuildContext context, required Widget child}) {
    showDialog<T>(
      context: context,
      child: child,
    ).then<void>((T? value) {
      // The value passed to Navigator.pop() or null.
    });
  }

  static showSnackBar({
    required BuildContext context,
    required String message,
    TextStyle? style,
    Color? backgroundColor,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: style ??
              appTextStyle.smallTSBasic.copyWith(color: AppColors.white),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
      ),
    );
  }

  static showCustomMessage(
      {required BuildContext context,
      String? title,
      String? message,
      Widget? titleText,
      Widget? messageText,
      Color backgroundColor = AppColors.black,
      Color titleColor = AppColors.scaffoldBGColor2,
      FlushbarPosition position = FlushbarPosition.BOTTOM,
      Curve reverseAnimationCurve = Curves.decelerate,
      Curve forwardAnimationCurve = Curves.elasticOut,
      bool isDismissible = false,
      Duration? duration,
      Widget? icon,
      Widget? mainButton}) async {
    Flushbar(
      title: title,
      titleColor: titleColor,
      message: message,
      flushbarPosition: position,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: reverseAnimationCurve,
      forwardAnimationCurve: forwardAnimationCurve,
      backgroundColor: backgroundColor,
      isDismissible: isDismissible,
      duration: duration ?? const Duration(seconds: 3),
      icon: icon,
      mainButton: mainButton,
      titleText: titleText,
      messageText: messageText,
    ).show(context);
  }

  static showWarningMessage(
      {required BuildContext context,
      String? title,
      String? message,
      Widget? titleText,
      Widget? messageText,
      Duration? duration,
      Color backgroundColor = AppColors.black,
      Color titleColor = AppColors.scaffoldBGColor2,
      FlushbarPosition position = FlushbarPosition.BOTTOM}) async {
    showCustomMessage(
        title: title,
        titleColor: titleColor,
        message: message,
        position: position,
        context: context,
        duration: duration,
        icon: const Icon(
          Icons.warning_amber_rounded,
          size: 15,
          color: AppColors.secondaryColor2,
        ));
  }

  static showErrorMessage(
      {required BuildContext context,
      String? title,
      String? message,
      Widget? titleText,
      Widget? messageText,
      Color backgroundColor = AppColors.black,
      Color titleColor = AppColors.scaffoldBGColor2,
      FlushbarPosition position = FlushbarPosition.BOTTOM}) async {
    showCustomMessage(
        title: title,
        titleColor: titleColor,
        message: message,
        position: position,
        context: context,
        icon: const Icon(
          Icons.error_outline,
          size: 15,
          color: AppColors.red,
        ));
  }
}

AppUtils appUtils = AppUtils();
