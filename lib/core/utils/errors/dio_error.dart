import '../../managers/managers.dart';
import 'base_error.dart';

class BaseDioError extends BaseError {
  BaseDioError(String? message) : super(message);
}

class CancelDioError extends BaseDioError {
  CancelDioError({String? message})
      : super(message ?? translate.dio_cancel_error);
}

class ConnectTimeoutDioError extends BaseDioError {
  ConnectTimeoutDioError({String? message})
      : super(message ?? translate.dio_connection_timeout_error);
}

class ReceiveTimeoutDioError extends BaseDioError {
  ReceiveTimeoutDioError({String? message})
      : super(message ?? translate.dio_receive_connection_timeout_error);
}

class ConnectionDioError extends BaseDioError {
  ConnectionDioError({String? message})
      : super(message ?? translate.something_went_wrong_check_connection);
}

class ResponseDioError extends BaseDioError {
  ResponseDioError({String? message})
      : super(message ?? translate.error_unexpected);
}

class SendTimeoutDioError extends BaseDioError {
  SendTimeoutDioError({String? message})
      : super(message ?? translate.dio_send_timeout_to_the_server);
}

class BadRequestDioError extends BaseDioError {
  BadRequestDioError({String? message})
      : super(message ?? translate.dio_bad_request_error);
}

class NotFoundDioError extends BaseDioError {
  NotFoundDioError({String? message})
      : super(message ?? translate.dio_not_found_error);
}

class InternalServerError extends BaseError {
  InternalServerError({String? message})
      : super(message ?? translate.error_unexpected);
}

class NetworkConnectionError extends BaseError {
  NetworkConnectionError() : super(translate.connection_error);
}
