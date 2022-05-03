import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:urbanminded_assessment/core/managers/network/dio_client.dart';
import 'package:urbanminded_assessment/core/managers/network/error_util.dart';
import 'package:urbanminded_assessment/core/model/result.dart';
import 'main_datasource_i.dart';

@Named('remote')
@Injectable(as: IMainDatasource)
class AuthService implements IMainDatasource {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  AuthService(this._dioClient) ;

  @override
  Future<Result<int>> getSite(
      {required String url, CancelToken? cancelToken}) async {
    try {
      final res = await _dioClient.get(url, cancelToken: cancelToken);

      if (res.statusCode == 200 ) {
        return Result(data: res.statusCode);
      } else {
        return Result(error: ErrorUtil.handleError(res));
      }
    } catch (e) {
      rethrow;
    }
  }
}
