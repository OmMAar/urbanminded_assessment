import 'package:urbanminded_assessment/core/managers/localization/app_translation.dart';
import 'base_error.dart';

class UnProcessableError extends BaseError {
  const UnProcessableError(
    String message, [
    this.statusCode,
  ]) : super(message);
  final int? statusCode;
  factory UnProcessableError.defaultMessage() =>
      UnProcessableError(translate.unknown_error);
}
