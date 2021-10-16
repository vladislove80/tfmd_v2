import 'package:tfmd_v2/app/db/home_hive_model.dart';
import 'package:tfmd_v2/app/model/response/weather_response.dart';

class HomeModel {
  final double? latitude;
  final double? longitude;
  final String? city;
  final List<DayForecastModel>? dayForecast;

  HomeModel({
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.dayForecast,
  });

  static List<DayForecastModel>? fromForecastResponse(
    List<DayForecast>? forecastResponse,
  ) =>
      forecastResponse?.map(
        (e) {
          var weather = e.weather;
          var isNotEmptyWeather = weather?.isNotEmpty;
          var isNotNullWeather = isNotEmptyWeather ?? false;

          return DayForecastModel(
            date: e.date,
            humidity: e.humidity,
            speed: e.speed,
            rain: e.rain,
            day: e.temp?.day,
            min: e.temp?.min,
            max: e.temp?.max,
            night: e.temp?.night,
            evening: e.temp?.evening,
            morning: e.temp?.morning,
            weatherDescription: (isNotNullWeather) ? weather?.first.main : '',
            weatherMessage:
                (isNotNullWeather) ? e.weather?.first.description : '',
            weatherIcon: e.weather?.first.icon,
          );
        },
      ).toList();

  static List<DayForecastModel>? fromForecastHiveModel(
    List<DayForecastHiveModel>? forecastResponse,
  ) =>
      forecastResponse
          ?.map(
            (e) => DayForecastModel(
              date: e.date,
              humidity: e.humidity,
              speed: e.speed,
              rain: e.rain,
              day: e.day,
              min: e.min,
              max: e.max,
              night: e.night,
              evening: e.evening,
              morning: e.morning,
              weatherDescription: e.weatherDescription,
              weatherMessage: e.weatherMessage,
              weatherIcon: e.weatherIcon,
            ),
          )
          .toList();
}

class DayForecastModel {
  final double? date;
  final int? humidity;
  final double? speed;
  final double? rain;
  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? evening;
  final double? morning;
  final String? weatherMessage;
  final String? weatherDescription;
  final String? weatherIcon;

  DayForecastModel({
    this.date,
    this.humidity,
    this.speed,
    this.rain,
    this.day,
    this.min,
    this.max,
    this.night,
    this.evening,
    this.morning,
    this.weatherMessage,
    this.weatherDescription,
    this.weatherIcon,
  });
}
