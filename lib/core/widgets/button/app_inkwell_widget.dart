import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';

class AppInkWellWidget extends StatelessWidget {
  final Widget child;
  final Function() onTap;

  const AppInkWellWidget({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparent,
      child: child,
      onTap: onTap,
    );
  }
}
