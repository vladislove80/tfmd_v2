import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
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

  Future<LocationData?> getCurrentUserLocation() =>
      _locationManager.getCurrentUserLocation();

  Future<void> getWeatherForecast() async {
    final location = await getCurrentUserLocation();
    var latitude = location?.latitude;
    var longitude = location?.longitude;
    if (latitude != null && longitude != null) await _weatherManager.getWeatherForecast(latitude, longitude, 'UA');
  }
}
