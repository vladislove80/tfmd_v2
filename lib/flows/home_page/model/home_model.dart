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
            sunrise: e.sunrise,
            sunset: e.sunset,
            humidity: e.humidity,
            speed: e.speed,
            rain: e.rain,
            day: e.temp?.day?.round(),
            min: e.temp?.min?.round(),
            max: e.temp?.max?.round(),
            night: e.temp?.night?.round(),
            evening: e.temp?.evening?.round(),
            morning: e.temp?.morning?.round(),
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
              sunrise: e.sunrise,
              sunset: e.sunset,
              humidity: e.humidity,
              speed: e.speed,
              rain: e.rain,
              day: e.day?.round(),
              min: e.min?.round(),
              max: e.max?.round(),
              night: e.night?.round(),
              evening: e.evening?.round(),
              morning: e.morning?.round(),
              weatherDescription: e.weatherDescription,
              weatherMessage: e.weatherMessage,
              weatherIcon: e.weatherIcon,
            ),
          )
          .toList();

  String? getDateRange() {
    final date1 = dayForecast?.first.date;
    final date2 = dayForecast?.last.date;
    if (date1 != null && date2 != null) {
      var dateTime1 = DateTime.fromMillisecondsSinceEpoch(date1 * 1000);
      var dateTime2 = DateTime.fromMillisecondsSinceEpoch(date2 * 1000);
      return '${dateTime1.day}/${dateTime1.month} - ${dateTime2.day}/${dateTime2.month}';
    }
  }
}

class DayForecastModel {
  final int? date;
  final int? sunrise;
  final int? sunset;
  final int? humidity;
  final double? speed;
  final double? rain;
  final int? day;
  final int? min;
  final int? max;
  final int? night;
  final int? evening;
  final int? morning;
  final String? weatherMessage;
  final String? weatherDescription;
  final String? weatherIcon;

  DayForecastModel({
    this.date,
    this.sunrise,
    this.sunset,
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

  String getDateLabel() {
    var dateTime = date != null
        ? DateTime.fromMillisecondsSinceEpoch(date! * 1000)
        : DateTime.now();
    return '${dateTime.day}/${dateTime.month}';
  }
}
