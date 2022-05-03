// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../modules/home/data/datasource/main_datasource_i.dart' as _i6;
import '../../modules/home/data/datasource/main_remote_datasource.dart' as _i7;
import '../../modules/home/domain/repo/home_repo.dart' as _i10;
import '../../modules/home/domain/repo/home_repo_i.dart' as _i9;
import '../helpers/hlp_shared_preference.dart' as _i11;
import '../managers/navigation/app_navigator.dart' as _i3;
import '../managers/network/dio_client.dart' as _i5;
import 'injector_module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final serviceModule = _$ServiceModule();
  gh.lazySingleton<_i3.AppNavigator>(() => _i3.AppNavigator());
  gh.lazySingleton<_i4.Dio>(() => serviceModule.dio);
  gh.factory<_i5.DioClient>(() => _i5.DioClient(get<_i4.Dio>()));
  gh.factory<_i6.IMainDatasource>(() => _i7.AuthService(get<_i5.DioClient>()),
      instanceName: 'remote');
  await gh.factoryAsync<_i8.SharedPreferences>(() => serviceModule.prefs,
      preResolve: true);
  gh.factory<_i9.IHomeRepo>(
      () => _i10.HomeRepo(get<_i6.IMainDatasource>(instanceName: 'remote')));
  gh.lazySingleton<_i11.SharedPreferenceHelper>(
      () => _i11.SharedPreferenceHelper(get<_i8.SharedPreferences>()));
  return get;
}

class _$ServiceModule extends _i12.ServiceModule {}
