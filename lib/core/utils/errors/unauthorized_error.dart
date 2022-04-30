import 'package:urbanminded_assessment/core/managers/localization/app_translation.dart';

import 'base_error.dart';

class UnauthorizedError extends BaseError {
  UnauthorizedError({String? message})
      : super(message ?? translate.un_authorized_error);
}
