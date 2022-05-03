import '../../managers/managers.dart';

abstract class BaseError {
  final String? message;
  final String? statusCode;
  const BaseError({this.message,this.statusCode});
}

class CustomError extends BaseError {
  CustomError({String? message}) : super(message:message ?? translate.error_unexpected);
}
