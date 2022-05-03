import 'package:dio/dio.dart';

import '../../utils/errors/errors.dart';
import '../../utils/utils.dart';
import '../managers.dart';

class ErrorUtil {
  // general methods:------------------------------------------------------------
  static BaseError handleError(dynamic error) {
    String errorDescription = '';
    String defaultError = translate.error_unexpected;
    appPrint('error is $error | type is  ${error.runtimeType}');
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          return CancelDioError(statusCode: error.response?.statusCode?.toString()??DioErrorType.cancel.name);
        case DioErrorType.connectTimeout:
          return ConnectTimeoutDioError(statusCode: error.response?.statusCode?.toString()??DioErrorType.cancel.name);
        case DioErrorType.other:
          return ConnectionDioError(statusCode: error.response?.statusCode?.toString()??DioErrorType.cancel.name);
        case DioErrorType.receiveTimeout:
          return ReceiveTimeoutDioError(statusCode: error.response?.statusCode?.toString()??DioErrorType.cancel.name);
        case DioErrorType.response:
          return _handleDioResponseError(
              error.response?.statusCode, error.response?.data);
        case DioErrorType.sendTimeout:
          return SendTimeoutDioError(statusCode: error.response?.statusCode?.toString()??DioErrorType.cancel.name);
      }
    } else {
      return UnexpectedError(statusCode: error.response?.statusCode);
    }
  }

  static BaseError _handleDioResponseError(int? statusCode, dynamic error) {
    /// if you want to do something depend on the status code
    switch (statusCode) {
      case 400:
        return BadRequestDioError(message: error['message'], statusCode: statusCode.toString());
      case 404:
        return NotFoundDioError(message: error['message'], statusCode: statusCode.toString());
      case 500:
        return InternalServerError(statusCode: statusCode.toString());
      default:
        return UnexpectedError(
            message: translate.error_unexpected,statusCode: statusCode.toString());
    }
  }
}
