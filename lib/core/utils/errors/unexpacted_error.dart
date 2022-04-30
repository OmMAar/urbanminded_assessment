import 'package:urbanminded_assessment/core/managers/localization/app_translation.dart';
import 'base_error.dart';

class UnexpectedError extends BaseError {
  const UnexpectedError(
    String message, [
    this.statusCode,
  ]) : super(message);
  final int? statusCode;
  factory UnexpectedError.defaultMessage() =>
      UnexpectedError(translate.error_unexpected);
}
