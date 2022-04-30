import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urbanminded_assessment/core/constants/app_endpoints.dart';

@module
abstract class ServiceModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          connectTimeout: Endpoints.connectionTimeout,
          receiveTimeout: Endpoints.receiveTimeout,
        ),
      )..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: kDebugMode,
          compact: true,
          maxWidth: 250));
}
