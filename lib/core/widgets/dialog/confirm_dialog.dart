import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/di/di.dart';
import 'package:urbanminded_assessment/core/managers/localization/app_translation.dart';
import 'package:urbanminded_assessment/core/widgets/widgets.dart';

class ConfirmDialog extends StatefulWidget {
  final String title;
  final String desc;
  final Function() confirmAction;

  const ConfirmDialog(
      {Key? key,
      required this.desc,
      required this.title,
      required this.confirmAction})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ConfirmDialogState();
}

class ConfirmDialogState extends State<ConfirmDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 750));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutBack);

    controller.addListener(() {
      if (mounted) setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const VerticalPadding(
                    percentage: 0.02,
                  ),
                  Text(
                    widget.title,
                    style: appTextStyle.normalTSBasic.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const VerticalPadding(
                    percentage: 0.02,
                  ),
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: AppDimens.space4),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      widget.desc,
                      style: appTextStyle.middleTSBasic
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const VerticalPadding(
                    percentage: 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: Text(
                      translate.cancel,
                      style: appTextStyle.middleTSBasic
                          .copyWith(color: AppColors.darkGrey),
                        ),
                        onPressed: () {
                      navigator.pop();
                        },
                      ),
                      TextButton(
                        child: Text(
                      translate.confirm,
                      style: appTextStyle.middleTSBasic
                          .copyWith(color: AppColors.primaryColor),
                        ),
                        onPressed: widget.confirmAction,
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
