import 'package:intl/intl.dart';
import 'package:tfmd_v2/app/db/home_hive_model.dart';
import 'package:tfmd_v2/app/model/response/weather_response.dart';
import 'package:tfmd_v2/flows/home_page/model/forecast_type.dart';

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
    List<DayForecast>? forecastResponse, {
    required ForecastType type,
  }) {
    final isDailyForecastType = type == ForecastType.DAYS_FORECAST;
    return forecastResponse?.map(
      (e) {
        var weather = e.weather;
        var isNotEmptyWeather = weather?.isNotEmpty;
        var isNotNullWeather = isNotEmptyWeather ?? false;

        return DayForecastModel(
          date: e.date,
          sunrise: e.sunrise,
          sunset: e.sunset,
          humidity: isDailyForecastType ? e.humidity : e.main?.humidity,
          speed: e.speed,
          pop: e.pop,
          day: isDailyForecastType
              ? e.temp?.day?.round()
              : e.main?.temp?.round(),
          min:
              isDailyForecastType ? e.temp?.min?.round() : e.main?.min?.round(),
          max:
              isDailyForecastType ? e.temp?.max?.round() : e.main?.max?.round(),
          night: e.temp?.night?.round(),
          evening: e.temp?.evening?.round(),
          morning: e.temp?.morning?.round(),
          weatherDescription: (isNotNullWeather) ? weather?.first.main : '',
          weatherMessage:
              (isNotNullWeather) ? e.weather?.first.description : '',
          weatherIcon: e.weather?.first.icon,
          drTxt: e.dtText,
        );
      },
    ).toList();
  }

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
              pop: e.pop,
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
  final double? pop;
  final int? day;
  final int? min;
  final int? max;
  final int? night;
  final int? evening;
  final int? morning;
  final String? weatherMessage;
  final String? weatherDescription;
  final String? weatherIcon;
  final String? drTxt;

  DayForecastModel({
    this.date,
    this.sunrise,
    this.sunset,
    this.humidity,
    this.speed,
    this.pop,
    this.day,
    this.min,
    this.max,
    this.night,
    this.evening,
    this.morning,
    this.weatherMessage,
    this.weatherDescription,
    this.weatherIcon,
    this.drTxt,
  });

  String getDateLabel(ForecastType forecastType) {
    if (ForecastType.DAYS_FORECAST == forecastType) {
      var dateTime = date != null
          ? DateTime.fromMillisecondsSinceEpoch(date! * 1000)
          : DateTime.now();
      return '${dateTime.day}/${dateTime.month}';
    } else {
      final parsedDate = drTxt != null ? DateTime.parse(drTxt!) : null;
      return parsedDate == null ? '' : DateFormat('HH:mm').format(parsedDate);
    }
  }
}
