import 'package:dio/dio.dart';
import 'package:urbanminded_assessment/core/model/result.dart';


mixin IMainDatasource {
  Future<Result<int>> getSite(
      {required String url, CancelToken? cancelToken});
}
