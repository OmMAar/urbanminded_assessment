import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/utils/utils.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.getScaledWidth(context, 1);
    double height = DeviceUtils.getScaledHeight(context, 1);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Home",
          style: appTextStyle.middleTSBasic.copyWith(
            color: AppColors.black
          ),
        ),
        // systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      ),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: Text(
              "Home",
              style: appTextStyle.middleTSBasic.copyWith(
                  color: AppColors.black
              ),
            ),
          ),
        ),
      ),
    );
  }
}
