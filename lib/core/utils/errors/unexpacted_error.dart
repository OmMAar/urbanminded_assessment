import 'package:urbanminded_assessment/core/managers/localization/app_translation.dart';

import 'base_error.dart';

class UnexpectedError extends BaseError {
  const UnexpectedError({String? message, String? statusCode})
      : super(message: message, statusCode: statusCode);

  factory UnexpectedError.defaultMessage() =>
      UnexpectedError(message: translate.error_unexpected);
}
