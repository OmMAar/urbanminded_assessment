import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';


abstract class GlobalDecorations {
  static InputDecoration get kNormalFieldInputDecoration => InputDecoration(
      labelStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
      errorStyle: appTextStyle.subMinTSBasic.copyWith(
        color: Colors.red,
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkGrey),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkGrey),
      ));

  static InputDecoration get normalFieldUerManagementNInputDecoration =>
      InputDecoration(
        hintStyle: const TextStyle(color: AppColors.darkGrey),
        alignLabelWithHint: true,
        fillColor: AppColors.white,
        filled: true,
        labelStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
        errorStyle: appTextStyle.subMinTSBasic.copyWith(
          color: Colors.red,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.radius16)),
          borderSide: BorderSide(color: AppColors.white),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.radius16),
          ),
        ),
      );

  static InputDecoration get kBorderFieldInputDecoration => InputDecoration(
        alignLabelWithHint: false,
        labelStyle: appTextStyle.normalTSBasic,
        errorStyle: appTextStyle.subMinTSBasic.copyWith(
          color: Colors.red,
        ),
        filled: false,
      );

  static InputDecoration get underLineVerificationCOdeFieldInputDecoration =>
      InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 4),
          borderRadius: BorderRadius.only(),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 4),
          borderRadius: BorderRadius.only(),
        ),
        filled: false,
        errorStyle: appTextStyle.middleTSBasic.copyWith(
          color: Colors.red,
        ),
      );
}
