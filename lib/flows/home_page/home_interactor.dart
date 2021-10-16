import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tfmd_v2/app/db/hive_data_base.dart';
import 'package:tfmd_v2/app/prefs/prefs.dart';
import 'package:tfmd_v2/data/location/location_repository.dart';
import 'package:tfmd_v2/data/weather/remote_repository.dart';
import 'package:tfmd_v2/flows/home_page/model/forecast_type.dart';
import 'package:tfmd_v2/flows/home_page/model/home_model.dart';

@singleton
class HomeInteractor {
  final LocationRepository _locationRepository;
  final RemoteRepository _remoteRepository;

  HomeInteractor(
    this._locationRepository,
    this._remoteRepository,
  );

  Future<HomeModel?> getData({
    ForecastType type = ForecastType.DAYS_FORECAST,
  }) async {
    var homeModel = await getHomeModalFromRemote(type: type);
    final db = GetIt.instance.get<HiveDataBase>();
    if (homeModel != null) {
      await db.saveHomeModel(
        HiveDataBase.mapHomeToHive(homeModel),
      );
    } else {
      final v = await db.getHomeModel();
    }
    return homeModel;
  }

  Future<HomeModel?> getHomeModalFromRemote({
    ForecastType type = ForecastType.DAYS_FORECAST,
  }) async {
    final location = await _locationRepository.getCurrentUserLocation();
    final latitude = location?.latitude;
    final longitude = location?.longitude;

    final prefs = GetIt.instance.get<Prefs>();
    var localeIdentifier = await prefs.getCountryCode() ?? 'ru';

    if (latitude != null && longitude != null) {
      final city = await _locationRepository.getCurrentCity(
        latitude,
        longitude,
        localeIdentifier,
      );

      final weatherResponse = await _remoteRepository.getWeatherForecast(
        latitude,
        longitude,
        localeIdentifier,
        type: type,
      );

      return HomeModel(
        latitude: latitude,
        longitude: longitude,
        city: city.isNotEmpty ? city.first.locality : null,
        dayForecast: HomeModel.fromForecastResponse(
          weatherResponse.forecastList,
          type: type,
        ),
      );
    } else {
      final weatherResponse = await _remoteRepository.getKyivWeatherForecast(
        localeIdentifier,
        type: type,
      );

      return HomeModel(
        latitude: weatherResponse.city?.coord?.lat,
        longitude: weatherResponse.city?.coord?.lon,
        city: weatherResponse.city?.name,
        dayForecast: HomeModel.fromForecastResponse(
          weatherResponse.forecastList,
          type: type,
        ),
      );
    }
  }
}
