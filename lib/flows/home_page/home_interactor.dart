import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
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

  Future<HomeModel?> getWeather() async {
    final location = await _locationManager.getCurrentUserLocation();
    final latitude = location?.latitude;
    final longitude = location?.longitude;

    if (latitude != null && longitude != null) {
      final prefs = GetIt.instance.get<Prefs>();
      var localeIdentifier = await prefs.getCountryCode() ?? 'ua';
      final city = await _locationManager.getCurrentCity(
          latitude, longitude, localeIdentifier);
      final forecast =
          await _weatherManager.getWeatherForecast(latitude, longitude);

      //todo save to db. check connectivity and return from db if needed
      return HomeModel(
        position: location,
        city: city.isNotEmpty ? city.first.locality : null,
        forecast: forecast,
      );
    }
  }
}
