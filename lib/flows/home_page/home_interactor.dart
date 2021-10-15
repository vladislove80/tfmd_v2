import 'package:injectable/injectable.dart';
import 'package:tfmd_v2/data/location/location_repository.dart';
import 'package:tfmd_v2/data/weather/weather_repository.dart';

@singleton
class HomeInteractor {
  final LocationRepository _locationManager;
  final WeatherRepository _weatherManager;

  HomeInteractor(
    this._locationManager,
    this._weatherManager,
  );

  Future<void> getWeatherForecast() async {
    final location = await _locationManager.getCurrentUserLocation();
    final latitude = location?.latitude;
    final longitude = location?.longitude;
    if (latitude != null && longitude != null) {
      final city =
          await _locationManager.getCurrentCity(latitude, longitude, 'ua');
      if (city.isNotEmpty) city.first.locality;
      final forecast =
          await _weatherManager.getWeatherForecast(latitude, longitude);
    }
  }
}
