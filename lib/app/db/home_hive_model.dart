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
  final double? date;
  @HiveField(1)
  final int? humidity;
  @HiveField(2)
  final double? speed;
  @HiveField(3)
  final double? rain;
  @HiveField(4)
  final double? day;
  @HiveField(6)
  final double? min;
  @HiveField(7)
  final double? max;
  @HiveField(8)
  final double? night;
  @HiveField(9)
  final double? evening;
  @HiveField(10)
  final double? morning;
  @HiveField(11)
  final String? weatherMessage;
  @HiveField(12)
  final String? weatherDescription;
  @HiveField(13)
  final String? weatherIcon;

  DayForecastHiveModel({
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

  static List<DayForecastHiveModel>? fromModel(
    List<DayForecastModel>? dayForecast,
  ) =>
      dayForecast
          ?.map(
            (e) => DayForecastHiveModel(
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
            ),
          )
          .toList();
}
