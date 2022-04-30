import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/di/di.dart';
import 'package:urbanminded_assessment/core/utils/utils.dart';
import 'package:urbanminded_assessment/core/widgets/image/custom_icon_widget.dart';
import 'package:urbanminded_assessment/core/widgets/widgets.dart';

class MessageIconDialog extends StatelessWidget {
  final double radius;
  final String? svgIcon;
  final IconData? icon;
  final double size;
  final Color color;
  final String title;
  final String? subTitle;

  const MessageIconDialog({
    Key? key,
    this.icon,
    required this.title,
    this.subTitle,
    this.svgIcon,
    this.radius = 0.0,
    this.size = 12.0,
    this.color = AppColors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
            margin: const EdgeInsets.all(AppDimens.space48),
            padding: const EdgeInsetsDirectional.only(
                bottom: AppDimens.verticalPadding,
                start: AppDimens.verticalPadding),
            constraints: const BoxConstraints(minHeight: 200),
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: InkWell(
                    onTap: () => navigator.pop(),
                    child: const Padding(
                      padding: EdgeInsets.all(AppDimens.verticalPadding),
                      child: SizedBox(
                        child: Icon(
                          Icons.clear,
                          size: 20,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.verticalPadding),
                  child: Visibility(
                      visible: AppUtils.notNullOrEmpty(svgIcon) || icon != null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(AppDimens.space4),
                            child: CustomIconWidget(
                              svgIcon: svgIcon,
                              size: size,
                              icon: icon,
                              radius: radius,
                              color: color,
                            ),
                          ),
                          const VerticalPadding(
                            percentage: 0.02,
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.verticalPadding),
                  child: Text(
                    title,
                    style: appTextStyle.normalTSBasic.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.verticalPadding),
                  child: Visibility(
                      visible: AppUtils.notNullOrEmpty(subTitle),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const VerticalPadding(
                            percentage: 0.02,
                          ),
                          Text(
                            subTitle ?? "",
                            style: appTextStyle.smallTSBasic
                                .copyWith(color: AppColors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
