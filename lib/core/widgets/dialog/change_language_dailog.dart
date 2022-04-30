import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/managers/managers.dart';
import 'package:urbanminded_assessment/core/widgets/widgets.dart';

class ChangeLanguageDialog extends StatefulWidget {
  const ChangeLanguageDialog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangeLanguageDialogState();
}

class _ChangeLanguageDialogState extends State<ChangeLanguageDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late AppLanguage appLanguage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLanguage = Provider.of<AppLanguage>(context);
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 750));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeOutBack);

    controller.addListener(() {
      setState(() {});
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
              width: 300,
              margin: const EdgeInsets.all(AppDimens.space32),
              padding: const EdgeInsets.all(AppDimens.space20),
              decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.radius16))),
              child: Wrap(
                children: <Widget>[
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      translate.changeLanguage,
                      style: appTextStyle.subBigTSBasic.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const VerticalPadding(
                    percentage: 0.02,
                  ),
                  const Divider(
                    height: 20.0,
                    color: AppColors.primaryColor,
                  ),
                  const VerticalPadding(
                    percentage: 0.02,
                  ),
                  _selectedButton(
                      langCode: AppStrings.LANG_AR,
                      title: "العربية",
                      correctValue: appLanguage.langCode == AppStrings.LANG_AR),
                  const VerticalPadding(
                    percentage: 0.02,
                  ),
                  _selectedButton(
                      langCode: AppStrings.LANG_EN,
                      title: "English",
                      correctValue: appLanguage.langCode == AppStrings.LANG_EN),
                ],
              )),
        ),
      ),
    );
  }

  Widget _selectedButton(
      {String? title,
      required String langCode,
      // required String langFlag,
      bool correctValue = false}) {
    return InkWell(
      onTap: () async {
        if (correctValue) {
          Navigator.pop(context);
          return;
        }
        appLanguage.changeLanguage(Locale(langCode));
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(AppDimens.space12),
        color: correctValue
            ? AppColors.lightGrey.withOpacity(0.5)
            : AppColors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title ?? " ",
              style: appTextStyle.middleTSBasic.copyWith(
                  color:
                  correctValue ? AppColors.primaryColor : AppColors.black,
                  fontWeight:
                  correctValue ? FontWeight.bold : FontWeight.normal),
            ),
            correctValue
                ? const Icon(
                    Icons.check_circle,
                    color: AppColors.primaryColor,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
