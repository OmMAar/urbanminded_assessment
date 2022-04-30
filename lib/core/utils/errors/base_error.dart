import '../../managers/managers.dart';

abstract class BaseError {
  final String? message;
  const BaseError(this.message);
}

class CustomError extends BaseError {
  CustomError({String? message}) : super(message ?? translate.error_unexpected);
}
