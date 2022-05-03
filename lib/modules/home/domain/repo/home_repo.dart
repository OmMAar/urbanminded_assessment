import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:urbanminded_assessment/core/model/result.dart';
import '../../data/datasource/main_datasource_i.dart';
import 'home_repo_i.dart';

@Injectable(as: IHomeRepo)
class HomeRepo implements IHomeRepo {
  final IMainDatasource service;

  HomeRepo(
    @Named('remote') this.service);

  @override
  Future<Result<int>> getSite(
      {required String url, CancelToken? cancelToken}) async {
    return await service
        .getSite(url: url, cancelToken: cancelToken)
        .then((value) {
      return value;
    }).catchError((error) => throw error);
  }
}
