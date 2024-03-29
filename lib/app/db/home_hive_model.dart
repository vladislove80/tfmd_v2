import 'package:hive_flutter/hive_flutter.dart';
import 'package:tfmd_v2/flows/home_page/model/home_model.dart';

part 'home_hive_model.g.dart';

@HiveType(typeId: 0)
class HomeHiveModel {
  @HiveField(0)
  final double? latitude;
  @HiveField(1)
  final double? longitude;
  @HiveField(2)
  final String? city;
  @HiveField(3)
  final List<DayForecastHiveModel>? dayForecast;
  @HiveField(4)
  final String? userToken;

  HomeHiveModel({
    this.latitude,
    this.longitude,
    this.city,
    this.dayForecast,
    this.userToken,
  });
}

@HiveType(typeId: 1)
class DayForecastHiveModel {
  @HiveField(0)
  final int? date;
  @HiveField(14)
  final int? sunrise;
  @HiveField(15)
  final int? sunset;
  @HiveField(1)
  final int? humidity;
  @HiveField(2)
  final double? speed;
  @HiveField(3)
  final double? pop;
  @HiveField(4)
  final int? day;
  @HiveField(6)
  final int? min;
  @HiveField(7)
  final int? max;
  @HiveField(8)
  final int? night;
  @HiveField(9)
  final int? evening;
  @HiveField(10)
  final int? morning;
  @HiveField(11)
  final String? weatherMessage;
  @HiveField(12)
  final String? weatherDescription;
  @HiveField(13)
  final String? weatherIcon;
  @HiveField(16)
  final String? drTxt;

  DayForecastHiveModel({
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

  static List<DayForecastHiveModel>? fromModel(
    List<DayForecastModel>? dayForecast,
  ) =>
      dayForecast
          ?.map(
            (e) => DayForecastHiveModel(
              date: e.date,
              sunrise: e.sunrise,
              sunset: e.sunset,
              humidity: e.humidity,
              speed: e.speed,
              pop: e.pop,
              day: e.day,
              min: e.min,
              max: e.max,
              night: e.night,
              evening: e.evening,
              morning: e.morning,
              weatherIcon: e.weatherIcon,
              weatherDescription: e.weatherDescription,
              weatherMessage: e.weatherMessage,
              drTxt: e.drTxt,
            ),
          )
          .toList();
}
