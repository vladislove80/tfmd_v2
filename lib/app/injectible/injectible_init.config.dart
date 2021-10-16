// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/location/location_repository.dart' as _i5;
import '../../data/weather/weather_repository.dart' as _i7;
import '../../flows/home_page/home_interactor.dart' as _i9;
import '../api/api.dart' as _i8;
import '../db/hive_data_base.dart' as _i3;
import '../location/location_manager.dart' as _i4;
import '../prefs/prefs.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.HiveDataBase>(() => _i3.HiveDataBase());
  gh.lazySingleton<_i4.LocationManager>(() => _i4.LocationManager());
  gh.lazySingleton<_i5.LocationRepository>(() => _i5.LocationRepository());
  gh.lazySingleton<_i6.Prefs>(() => _i6.Prefs());
  gh.lazySingleton<_i7.WeatherRepository>(
      () => _i7.WeatherRepository(get<_i8.ApiManager>()));
  gh.singleton<_i8.ApiManager>(_i8.ApiManager());
  gh.singleton<_i9.HomeInteractor>(_i9.HomeInteractor(
      get<_i5.LocationRepository>(), get<_i7.WeatherRepository>()));
  return get;
}
