// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/location_repository.dart' as _i4;
import '../../flows/home_page/home_interactor.dart' as _i6;
import '../location/location_manager.dart' as _i3;
import '../prefs/prefs.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.LocationManager>(() => _i3.LocationManager());
  gh.lazySingleton<_i4.LocationRepository>(() => _i4.LocationRepository());
  gh.lazySingleton<_i5.Prefs>(() => _i5.Prefs());
  gh.singleton<_i6.HomeInteractor>(
      _i6.HomeInteractor(get<_i4.LocationRepository>()));
  return get;
}
