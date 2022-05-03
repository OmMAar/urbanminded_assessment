import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

import 'error_util.dart';
import '../../model/result.dart';

@injectable
class DioClient {
  // dio instance
  final Dio _dio;

  // injecting dio instance
  DioClient(this._dio);

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Result<dynamic>> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return Result(data: response.data);
    } catch (e) {
      return Result(error: ErrorUtil.handleError(e));
    }
  }

  Future<Result<dynamic>> postWithFile(
    String uri, {
    Map<String, dynamic>? data,
    required String fileKey,
    required String filePath,
    required String fileName,
    required String extension,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Map<String, dynamic> dataMap = {};
      if (data != null) {
        dataMap.addAll(data);
      }

      dataMap.addAll({
        fileKey: await MultipartFile.fromFile(
          filePath,
          filename: fileName,
          contentType: MediaType("image", extension),
        ),
      });

      if (kDebugMode) {
        print('--------------------  Start Request Body  --------------------'
            ' \n The URL is : [$uri]');
        print('The sended Object Request is : $data');
        print('The sended dataMap Request is : $dataMap');
        // print('The headers is : ${options!.headers}');
        print('The filePath is : $filePath \n '
            '--------------------  End Request Body  --------------------'
            ' \n');
      }

      final Response response = await _dio.post(
        uri,
        data: FormData.fromMap(dataMap),
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return Result(data: response.data);
    } catch (e) {
      return Result(error: ErrorUtil.handleError(e));
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Result<dynamic>> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return Result(data: response.data);
    } catch (e) {
      return Result(error: ErrorUtil.handleError(e));
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<Result<dynamic>> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return Result(data: response.data);
    } catch (e) {
      return Result(error: ErrorUtil.handleError(e));
    }
  }
}
