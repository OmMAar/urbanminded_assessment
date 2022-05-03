import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/di/di.dart';
import 'package:urbanminded_assessment/core/utils/utils.dart';
import 'package:urbanminded_assessment/core/widgets/widgets.dart';






class AddNewSiteDialog extends StatefulWidget {
  const AddNewSiteDialog({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _AddNewSiteDialogState();
}

class _AddNewSiteDialogState extends State<AddNewSiteDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  late TextEditingController _siteUrlController;

  final formKey = GlobalKey<FormState>();



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _siteUrlController = TextEditingController();
    controller =
        AnimationController(vsync: this, duration:const Duration(milliseconds: 750));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutBack);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double widthC = DeviceUtils.getScaledWidth(context, 1);
    return Container(
      margin: MediaQuery.of(context).viewInsets,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
                width: widthC * 0.85,
                padding: const EdgeInsets.all(AppDimens.space8),
                decoration: ShapeDecoration(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(AppRadius.radius16))),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Padding(
                            padding:
                            EdgeInsets.all(AppDimens.space4),
                            child: Icon(Icons.clear),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.space20),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                        "Site Url",
                          style: appTextStyle.subBigTSBasic.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const VerticalPadding(
                        percentage: 0.07,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.space8),
                        child: NormalFormField(
                          hintText: "Url",
                          style: appTextStyle.middleTSBasic
                              .copyWith(color: AppColors.black),
                          textAlign: TextAlign.start,
                          controller: _siteUrlController,
                          showRequiredLabel: true,
                          isDense: true,
                          onChanged: (value) {
                            // setState(() {
                            //   _emailValidation = true;
                            // });
                          },
                          validator: (value) {
                            return BaseValidator.validateValue(
                              context,
                              value!,
                              [RequiredValidator()],
                              true,
                            );
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                      ),
                      const VerticalPadding(
                        percentage: 0.1,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.space8),
                        child: RoundedButtonWidget(
                            backgroundColor: AppColors.black,
                            borderRadius: AppRadius.radius16,
                            width: double.infinity,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                DeviceUtils.hideKeyboard(context);
                                navigator.pop(_siteUrlController.text);
                              }
                            },
                            child: Center(
                              child: Text(
                                "Add",
                                style: appTextStyle.smallTSBasic.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      const VerticalPadding(
                        percentage: 0.05,
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

}