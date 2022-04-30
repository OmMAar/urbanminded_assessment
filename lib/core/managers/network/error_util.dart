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
          return CancelDioError();
        case DioErrorType.connectTimeout:
          return ConnectTimeoutDioError();
        case DioErrorType.other:
          return ConnectionDioError();
        case DioErrorType.receiveTimeout:
          return ReceiveTimeoutDioError();
        case DioErrorType.response:
          return _handleDioResponseError(
              error.response?.statusCode, error.response?.data);
        case DioErrorType.sendTimeout:
          return SendTimeoutDioError();
      }
    }  else {
      return UnexpectedError.defaultMessage();
    }
  }

  static BaseError _handleDioResponseError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return BadRequestDioError(message: error['message']);
      case 404:
        return NotFoundDioError(message: error['message']);
      case 500:
        return InternalServerError();
      default:
        return UnexpectedError(error['message'] ?? translate.error_unexpected);
    }
  }

}
