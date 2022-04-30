import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/di/di.dart';
import 'package:urbanminded_assessment/core/managers/managers.dart';
import 'package:urbanminded_assessment/core/utils/utils.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  late AppLanguage appLanguage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // appLanguage = Provider.of<AppLanguage>(context);
    appLanguage = context.read<AppLanguage>();
  }

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.getScaledWidth(context, 1);
    double height = DeviceUtils.getScaledHeight(context, 1);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        // systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      ),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: const Center(
            child: FlutterLogo(
              size: 50,
            ),
          ),
        ),
      ),
    );
  }

  startTimer() {
    var _duration = const Duration(seconds: 4);
    return Timer(_duration, navigate);
  }

  navigate() async {
    navigator.pushReplacementNamed(Routes.home);
  }
}
