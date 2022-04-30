import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/widgets/widgets.dart';

class ItemTabWidget extends StatelessWidget {
  final String? title;
  final bool isSelected;

  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  const ItemTabWidget(
      {Key? key, this.title, this.isSelected = false, this.padding, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
              vertical: 0.0, horizontal: AppDimens.horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const VerticalPadding(
            percentage: 0.015,
          ),
          Text(
            title ?? '',
            style: style != null
                ? style!.copyWith(
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.secondaryColor,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w400)
                : appTextStyle.middleTSBasic.copyWith(
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.secondaryColor,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal),
          ),
          const VerticalPadding(
            percentage: 0.015,
          ),
          if (isSelected)
            ZoomIn(
              duration: const Duration(
                  milliseconds: AppAnimationDuration.mediumAnimationDuration),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.space6),
                height: 4.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.radius4),
                      topRight: Radius.circular(AppRadius.radius4)),
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      stops: [
                        0.0,
                        1.0
                      ],
                      colors: [
                        AppColors.gradientIndicator1,
                        AppColors.gradientIndicator2,
                      ]),
                ),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.space6),
              height: 4.0,
              decoration: const BoxDecoration(color: AppColors.transparent),
            )
        ],
      ),
    );
  }
}
