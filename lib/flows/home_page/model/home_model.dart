import 'package:geolocator/geolocator.dart';
import 'package:tfmd_v2/app/model/response/weather_response.dart';

class HomeModel {
  final Position? position;
  final String? city;
  final WeatherResponse? forecast;

  HomeModel({this.position, this.city, this.forecast});
}
