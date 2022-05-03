import 'package:urbanminded_assessment/core/managers/localization/app_translation.dart';

import 'base_error.dart';

class UnProcessableError extends BaseError {
  const UnProcessableError(String message, {String? statusCode})
      : super(message: message, statusCode: statusCode);

  factory UnProcessableError.defaultMessage() =>
      UnProcessableError(translate.unknown_error);
}
