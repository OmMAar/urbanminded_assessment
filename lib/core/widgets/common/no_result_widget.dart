import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/utils/utils.dart';
import 'package:urbanminded_assessment/core/widgets/widgets.dart';

class NoResultWidget extends StatelessWidget {
  final double? width;
  final IconData? icon;
  final Color? bgColor;
  final String? description;
  final TextStyle? descTextStyle;
  final Function() callback;

  const NoResultWidget(
      {Key? key,
      required this.callback,
      this.width,
      this.icon,
      this.description,
      this.descTextStyle,
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthC = width ?? DeviceUtils.getScaledWidth(context, 1);
    return Container(
        width: widthC,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon ?? Icons.hourglass_empty,
                size: widthC * .5,
                color: AppColors.black,
              ),
              const VerticalPadding(
                percentage: 0.04,
              ),
              AppUtils.notNullOrEmpty(description)
                  ? Text(description ?? "",
                      textAlign: TextAlign.center,
                      style: descTextStyle ??
                          appTextStyle.normalTSBasic.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ))
                  : Column(
                      children: [
                        /// todo: add translated message
                        Text("Opps!",
                            textAlign: TextAlign.center,
                            style: appTextStyle.normalTSBasic.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            )),
                        const VerticalPadding(
                          percentage: 0.02,
                        ),
                        Text("Something went wrong,\nplease try again.",
                            textAlign: TextAlign.center,
                            style: appTextStyle.middleTSBasic.copyWith(
                              color: AppColors.white,
                            )),
                      ],
                    ),
            ],
          ),
        ));
  }
}
