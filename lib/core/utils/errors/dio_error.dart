import '../../managers/managers.dart';
import 'base_error.dart';

class BaseDioError extends BaseError {
  BaseDioError(String? message,String? statusCode) : super(message:message,statusCode: statusCode);
}

class CancelDioError extends BaseDioError {
  CancelDioError({String? message,String? statusCode})
      : super(message ?? translate.dio_cancel_error,statusCode);
}

class ConnectTimeoutDioError extends BaseDioError {
  ConnectTimeoutDioError({String? message,String? statusCode})
      : super(message ?? translate.dio_connection_timeout_error,statusCode);
}

class ReceiveTimeoutDioError extends BaseDioError {
  ReceiveTimeoutDioError({String? message,String? statusCode})
      : super(message ?? translate.dio_receive_connection_timeout_error,statusCode);
}

class ConnectionDioError extends BaseDioError {
  ConnectionDioError({String? message,String? statusCode})
      : super(message ?? translate.something_went_wrong_check_connection,statusCode);
}

class ResponseDioError extends BaseDioError {
  ResponseDioError({String? message,String? statusCode})
      : super(message ?? translate.error_unexpected,statusCode);
}

class SendTimeoutDioError extends BaseDioError {
  SendTimeoutDioError({String? message,String? statusCode})
      : super(message ?? translate.dio_send_timeout_to_the_server,statusCode);
}

class BadRequestDioError extends BaseDioError {
  BadRequestDioError({String? message,String? statusCode})
      : super(message ?? translate.dio_bad_request_error,statusCode);
}

class NotFoundDioError extends BaseDioError {
  NotFoundDioError({String? message,String? statusCode})
      : super(message ?? translate.dio_not_found_error,statusCode);
}

class InternalServerError extends BaseError {
  InternalServerError({String? message,String? statusCode})
      : super(message:message ?? translate.error_unexpected,statusCode: statusCode);
}

class NetworkConnectionError extends BaseError {
  NetworkConnectionError(String? statusCode) : super(message:translate.connection_error,statusCode: statusCode);
}
