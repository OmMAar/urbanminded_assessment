import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';


class NormalFormField extends StatelessWidget {
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;
  final double borderRadius;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final bool isEnableFocusOnTextField;
  final bool readOnly;
  final bool filled;
  final bool isSecure;
  final bool isDense;
  final Color? fillColor;
  final Function? onTap;
  final Widget? prefixIcon;
  final BoxConstraints? prefixConstraints;
  final BoxConstraints? suffixConstraints;
  final Widget? suffixIcon;
  final Color? borderColor;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;

  final InputCounterWidgetBuilder? buildCounter;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final bool showRequiredLabel;
  final bool showLabel;
  const NormalFormField(
      {Key? key,
      this.validator,
      this.isEnableFocusOnTextField = true,
      this.showLabel = true,
      this.inputFormat,
      this.controller,
      this.keyboardType,
      this.onChanged,
      this.focusNode,
      this.nextNode,
      this.textInputAction,
      this.prefixConstraints,
      this.suffixConstraints,
      this.onTap,
      this.readOnly = false,
      this.isSecure = false,
      this.filled = false,
      this.isDense = false,
      this.showRequiredLabel = false,
      this.fillColor,
      this.textAlign,
      this.maxLines = 1,
      this.minLines,
      this.onFieldSubmitted,
      this.prefixIcon,
      this.suffixIcon,
      this.borderColor,
      this.style,
      this.contentPadding,
      this.maxLength,
      this.buildCounter,
      this.hintStyle,
      required this.hintText,
      this.borderRadius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: style ??
            appTextStyle.smallTSBasic.copyWith(
                color: AppColors.black,
                decorationThickness: 0,
                wordSpacing: 1.0),
        cursorColor: borderColor ?? AppColors.primaryColor,
        textCapitalization: TextCapitalization.sentences,
        cursorWidth: 1.5,
        textInputAction: textInputAction,
        maxLength: maxLength,
        // minLines: minLines??1,
        buildCounter: buildCounter,
        textAlignVertical: TextAlignVertical.center,
        textAlign: textAlign ?? TextAlign.start,
        decoration: InputDecoration(
            errorStyle: appTextStyle.subMinTSBasic.copyWith(
              color: Colors.red,
            ),
            counterStyle:
                appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
            contentPadding: contentPadding,
            hintText: hintText,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixConstraints ??
                const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
            suffixIconConstraints: suffixConstraints ??
                const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
            suffixIcon: suffixIcon,
            labelText: showLabel ? "$hintText ${showRequiredLabel? "*" :""}" : null,
            hintStyle: hintStyle ??
                appTextStyle.smallTSBasic.copyWith(color:borderColor?? AppColors.lightGrey),
            alignLabelWithHint: true,
            labelStyle: appTextStyle.middleTSBasic.copyWith(color: borderColor??AppColors.black),
            isDense: isDense,
            enabledBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color: borderColor??AppColors.lightGrey),
            ),
            focusedBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color: borderColor?? AppColors.primaryColor),
            ),
            border:  UnderlineInputBorder(
              borderSide: BorderSide(color: borderColor?? AppColors.lightGrey),
            ),
            filled: filled,
            fillColor: fillColor),
        validator: validator,
        enabled: isEnableFocusOnTextField,
        inputFormatters: inputFormat,
        keyboardType: keyboardType,
        onChanged: onChanged,
        focusNode: focusNode,
        maxLines: maxLines,
        obscureText: isSecure,
        readOnly: readOnly,
        onTap: onTap != null ? onTap as void Function()? : () {},
        onFieldSubmitted: onFieldSubmitted ??
            (term) {
              _fieldFocusChange(context, focusNode, nextNode);
            });
  }

  _fieldFocusChange(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}

class NormalFormPasswordField extends StatefulWidget {
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;
  final double borderRadius;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final bool isEnableFocusOnTextField;
  final bool readOnly;
  final bool filled;
  final Color? fillColor;
  final Function? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final double? suffixIconSize;
  final bool isDense;
  final bool showRequiredLabel;
  final Color? borderColor;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;

  final InputCounterWidgetBuilder? buildCounter;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;

  const NormalFormPasswordField(
      {Key? key,
      this.validator,
      this.isEnableFocusOnTextField = true,
      this.inputFormat,
      this.controller,
      this.keyboardType,
      this.onChanged,
      this.focusNode,
      this.nextNode,
      this.textInputAction,
      this.onTap,
      this.readOnly = false,
      this.filled = false,
      this.isDense = false,
      this.showRequiredLabel = false,
      this.fillColor,
      this.textAlign,
      this.maxLines = 1,
      this.minLines,
      this.onFieldSubmitted,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixIconColor,
      this.suffixIconSize = 20,
      this.borderColor,
      this.style,
      this.contentPadding,
      this.maxLength,
      this.buildCounter,
      this.hintStyle,
      required this.hintText,
      this.borderRadius = 0})
      : super(key: key);

  @override
  _NormalFormPasswordFieldState createState() =>
      _NormalFormPasswordFieldState();
}

class _NormalFormPasswordFieldState extends State<NormalFormPasswordField> {
  bool isSecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        style: widget.style ??
            appTextStyle.smallTSBasic.copyWith(
                color: AppColors.black,
                decorationThickness: 0,
                wordSpacing: 1.0),
        cursorColor: widget.borderColor ?? AppColors.lightGrey,
        textCapitalization: TextCapitalization.sentences,
        cursorWidth: 1.5,
        maxLength: widget.maxLength,
        // minLines: minLines??1,
        buildCounter: widget.buildCounter,
        textAlignVertical: TextAlignVertical.center,
        textAlign: widget.textAlign ?? TextAlign.start,
        decoration: InputDecoration(
            errorStyle: appTextStyle.subMinTSBasic.copyWith(
              color: Colors.red,
            ),
            enabledBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color:  widget.borderColor??AppColors.lightGrey),
            ),
            focusedBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color:  widget.borderColor?? AppColors.primaryColor),
            ),
            border:  UnderlineInputBorder(
              borderSide: BorderSide(color:  widget.borderColor?? AppColors.lightGrey),
            ),
            contentPadding: widget.contentPadding,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            isDense: widget.isDense,
            suffixIcon: widget.suffixIcon ??
                InkWell(
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        isSecureText = !isSecureText;
                      });
                    }
                  },
                  child: Icon(
                    isSecureText ? Icons.visibility : Icons.visibility_off,
                    color: widget.suffixIconColor ?? AppColors.lightGrey,
                    size: widget.suffixIconSize,
                  ),
                ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
               labelText: "${widget.hintText} ${widget.showRequiredLabel? "*" :""}",
            hintStyle: widget.hintStyle ??
                appTextStyle.smallTSBasic.copyWith(color: AppColors.lightGrey),
            alignLabelWithHint: false,
            labelStyle:
                appTextStyle.middleTSBasic.copyWith(color: AppColors.black),
            filled: widget.filled,
            fillColor: widget.fillColor),
        validator: widget.validator,
        enabled: widget.isEnableFocusOnTextField,
        inputFormatters: widget.inputFormat,
        keyboardType: widget.keyboardType,
        obscureText: isSecureText,
        obscuringCharacter: "*",
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        onTap: widget.onTap != null ? widget.onTap as void Function()? : () {},
        onFieldSubmitted: widget.onFieldSubmitted ??
            (term) {
              _fieldFocusChange(context, widget.focusNode, widget.nextNode);
            });
  }

  _fieldFocusChange(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}

class RoundedFormField extends StatelessWidget {
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;
  final double borderRadius;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final bool isEnableFocusOnTextField;
  final bool readOnly;
  final bool filled;
  final bool isDense;
  final Color? fillColor;
  final Function? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;

  final InputCounterWidgetBuilder? buildCounter;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;

  const RoundedFormField(
      {Key? key,
      this.validator,
      this.isEnableFocusOnTextField = true,
      this.inputFormat,
      this.controller,
      this.keyboardType,
      this.onChanged,
      this.focusNode,
      this.nextNode,
      this.textInputAction,
      this.onTap,
      this.readOnly = false,
      this.filled = false,
      this.isDense = false,
      this.fillColor,
      this.textAlign,
      this.maxLines = 1,
      this.minLines,
      this.onFieldSubmitted,
      this.prefixIcon,
      this.suffixIcon,
      this.textAlignVertical = TextAlignVertical.center,
      this.borderColor,
      this.style,
      this.contentPadding,
      this.maxLength,
      this.buildCounter,
      this.hintStyle,
      required this.hintText,
      this.borderRadius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        minLines: minLines,
        scrollPhysics: const BouncingScrollPhysics(),
        scrollPadding:
            const EdgeInsets.symmetric(horizontal: AppDimens.space2),
        style: style ??
            appTextStyle.smallTSBasic.copyWith(
                color: AppColors.black,
                decorationThickness: 0,
                wordSpacing: 1.0),
        cursorColor: borderColor ?? AppColors.darkGrey,
        textCapitalization: TextCapitalization.sentences,
        cursorWidth: 1.5,
        maxLength: maxLength,
        // minLines: minLines??1,

        buildCounter: buildCounter,
        textAlignVertical: textAlignVertical,
        textAlign: textAlign ?? TextAlign.start,
        decoration: InputDecoration(
            errorStyle: appTextStyle.subMinTSBasic.copyWith(
              color: Colors.red,
            ),
            isDense: isDense,
            counterStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
            contentPadding: contentPadding,
            focusedBorder: generalBoarder(
                borderRadius: borderRadius, borderColor: borderColor),
            enabledBorder: generalBoarder(
                borderRadius: borderRadius, borderColor: borderColor),
            errorBorder: generalBoarder(
                isError: true,
                borderRadius: borderRadius,
                borderColor: borderColor),
            border: generalBoarder(
                borderRadius: borderRadius, borderColor: borderColor),
            focusedErrorBorder: generalBoarder(
                isError: true,
                borderRadius: borderRadius,
                borderColor: borderColor),
            hintText: hintText,
            prefixIcon: prefixIcon,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            suffixIcon: suffixIcon,
             //  labelText: hintText??'',
            hintStyle: hintStyle ??
                appTextStyle.smallTSBasic
                    .copyWith(color: AppColors.darkGrey),
            alignLabelWithHint: true,
            labelStyle: appTextStyle.normalTSBasic.copyWith(color: AppColors.black),
            filled: filled,
            fillColor: fillColor),
        validator: validator,
        enabled: isEnableFocusOnTextField,
        inputFormatters: inputFormat,
        keyboardType: keyboardType,
        onChanged: onChanged,
        focusNode: focusNode,
        maxLines: maxLines,
        readOnly: readOnly,
        onTap: onTap != null ? onTap as void Function()? : () {},
        onFieldSubmitted: onFieldSubmitted ??
            (term) {
              _fieldFocusChange(context, focusNode, nextNode);
            });
  }

  _fieldFocusChange(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}

InputBorder generalBoarder(
    {bool isError = false, required double borderRadius, Color? borderColor}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: borderColor ?? AppColors.darkGrey,
      style: BorderStyle.solid,
      width: isError ? 1.5 : 0.5,
    ),
    borderRadius: BorderRadius.all(
        Radius.circular(borderRadius) //         <--- border radius here
        ),
  );
}
