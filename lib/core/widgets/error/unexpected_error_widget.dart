import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/utils/utils.dart';
import '../widgets.dart';
/// todo: ask the designer about error widgets
class UnExpectedErrorWidget extends StatelessWidget {
  final double? width;
  final Function() callback;

  const UnExpectedErrorWidget({Key? key, required this.callback, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthC = width ?? DeviceUtils.getScaledWidth(context, 1);
    return SizedBox(
        width: widthC,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_outlined,
                size: widthC * .5,
                color: AppColors.secondaryColor2,
              ),
              const VerticalPadding(
                percentage: 0.04,
              ),

              /// todo: add translated message
              Text("Opps!",
                  textAlign: TextAlign.center,
                  style: appTextStyle.normalTSBasic.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  )),
              const VerticalPadding(
                percentage: 0.02,
              ),
              /// todo: add translated message
              Text("Something went wrong,\nplease try again.",
                  textAlign: TextAlign.center,
                  style: appTextStyle.middleTSBasic.copyWith(
                    color: AppColors.black,
                  )),
              const VerticalPadding(
                percentage: 0.02,
              ),
              ElevatedButton(
                  onPressed: callback,
                  style: ElevatedButton.styleFrom(
                    onPrimary: AppColors.black,
                    primary: AppColors.secondaryColor,
                    // minimumSize: Size(88, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppRadius.radius6)),
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
