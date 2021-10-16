import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tfmd_v2/app/db/hive_data_base.dart';
import 'package:tfmd_v2/app/prefs/prefs.dart';
import 'package:tfmd_v2/data/location/location_repository.dart';
import 'package:tfmd_v2/data/weather/weather_repository.dart';
import 'package:tfmd_v2/flows/home_page/model/home_model.dart';

@singleton
class HomeInteractor {
  final LocationRepository _locationManager;
  final WeatherRepository _weatherManager;

  HomeInteractor(
    this._locationManager,
    this._weatherManager,
  );

  Future<HomeModel?> getData() async {
    var homeModel = await getHomeModalFromRemote();
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

  Future<HomeModel?> getHomeModalFromRemote() async {
    final location = await _locationManager.getCurrentUserLocation();
    final latitude = location?.latitude;
    final longitude = location?.longitude;

    final prefs = GetIt.instance.get<Prefs>();
    var localeIdentifier = await prefs.getCountryCode() ?? 'ru';

    if (latitude != null && longitude != null) {
      final city = await _locationManager.getCurrentCity(
        latitude,
        longitude,
        localeIdentifier,
      );

      final weatherResponse = await _weatherManager.getWeatherForecast(
        latitude,
        longitude,
        localeIdentifier,
      );

      return HomeModel(
        latitude: latitude,
        longitude: longitude,
        city: city.isNotEmpty ? city.first.locality : null,
        dayForecast: HomeModel.fromForecastResponse(
          weatherResponse.forecastList,
        ),
      );
    } else {
      final weatherResponse =
          await _weatherManager.getKyivWeatherForecast(localeIdentifier);

      return HomeModel(
        latitude: weatherResponse.city?.coord?.lat,
        longitude: weatherResponse.city?.coord?.lon,
        city: weatherResponse.city?.name,
        dayForecast: HomeModel.fromForecastResponse(
          weatherResponse.forecastList,
        ),
      );
    }
  }
}
