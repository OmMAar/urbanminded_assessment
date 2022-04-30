import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/utils/utils.dart';
import '../common/vertical_padding.dart';


class ConnectionErrorWidget extends StatelessWidget {
  final double? width;
  final Function() callback;
  const ConnectionErrorWidget({Key? key,this.width,required this.callback}):super(key: key);
  @override
  Widget build(BuildContext context) {
    double widthC = width ?? DeviceUtils.getScaledWidth(context, 1);
    return Container(
        width: widthC,
        decoration: const BoxDecoration(
          color: AppColors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off_outlined,
                size: widthC * .5,
                color: AppColors.black,
              ),
              const VerticalPadding(percentage: 0.04,),
              /// todo: add translated message
              Text("Whoops!",
                  textAlign: TextAlign.center,
                  style: appTextStyle.normalTSBasic.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  )),
              const VerticalPadding(percentage: 0.02,),
              /// todo: add translated message
              Text("There seems to be a problem with\nyour Network Connection.",
                  textAlign: TextAlign.center,
                  style: appTextStyle.middleTSBasic.copyWith(
                    color: AppColors.white,
                  )),
              const VerticalPadding(percentage: 0.02,),
              ElevatedButton(
                  onPressed: callback,
                  style:  ElevatedButton.styleFrom(
                    onPrimary: AppColors.black,
                    primary: AppColors.black,
                    // minimumSize: Size(88, 36),
                    padding:const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(AppRadius.radius6)),
                    ),
                  ),
                  /// todo: add translated message
                  child: Text(
                    "Try again",
                    style: appTextStyle.smallTSBasic
                        .copyWith(color: AppColors.white),
                  ))
            ],
          ),
        ));
  }
}
