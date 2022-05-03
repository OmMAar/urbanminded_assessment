import 'package:dio/dio.dart';
import 'package:urbanminded_assessment/core/model/result.dart';


mixin IHomeRepo {
  Future<Result<int>> getSite(
      {required String url, CancelToken? cancelToken});
}
