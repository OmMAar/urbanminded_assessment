import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';

class RoundedWidget extends StatelessWidget {

  final Color backgroundColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final Widget child;

  const RoundedWidget({
    Key? key,

    required this.backgroundColor,
    this.width,
    required this.child,
    this.height,
    this.borderRadius = 0.0,
    this.borderColor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 45,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          border: Border.all(
            width: 1.0,
            color:borderColor ?? AppColors.transparent,
          )
      ),
      child: Center(
        child: child,
      ),
    );
  }
}