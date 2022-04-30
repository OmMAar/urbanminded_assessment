import 'package:flutter/material.dart';

import 'base_validator.dart';

class RequiredValidator extends BaseValidator {
  bool? isFromVerificationPage;

  RequiredValidator({this.isFromVerificationPage});

  @override
  String getMessage(BuildContext? context) {
    /// todo: add translate message
    if (isFromVerificationPage != null && isFromVerificationPage!) return '*';
    /// todo: add translate message
    return "This field is required";
  }

  @override
  bool validate(String value) {
    return value.isNotEmpty;
  }
}
class RequiredSmallMessageValidator extends BaseValidator {
  bool? isFromVerificationPage;

  RequiredSmallMessageValidator({this.isFromVerificationPage});

  @override
  String getMessage(BuildContext? context) {
    /// todo: add translate message
    if (isFromVerificationPage != null && isFromVerificationPage!) return '*';
    return "required";
  }

  @override
  bool validate(String value) {
    return value.isNotEmpty;
  }
}
