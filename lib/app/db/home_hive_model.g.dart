// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeHiveModelAdapter extends TypeAdapter<HomeHiveModel> {
  @override
  final int typeId = 0;

  @override
  HomeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeHiveModel(
      latitude: fields[0] as double?,
      longitude: fields[1] as double?,
      city: fields[2] as String?,
      dayForecast: (fields[3] as List?)?.cast<DayForecastHiveModel>(),
      userToken: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.dayForecast)
      ..writeByte(4)
      ..write(obj.userToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DayForecastHiveModelAdapter extends TypeAdapter<DayForecastHiveModel> {
  @override
  final int typeId = 1;

  @override
  DayForecastHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayForecastHiveModel(
      date: fields[0] as int?,
      sunrise: fields[14] as int?,
      sunset: fields[15] as int?,
      humidity: fields[1] as int?,
      speed: fields[2] as double?,
      pop: fields[3] as double?,
      day: fields[4] as int?,
      min: fields[6] as int?,
      max: fields[7] as int?,
      night: fields[8] as int?,
      evening: fields[9] as int?,
      morning: fields[10] as int?,
      weatherMessage: fields[11] as String?,
      weatherDescription: fields[12] as String?,
      weatherIcon: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DayForecastHiveModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(14)
      ..write(obj.sunrise)
      ..writeByte(15)
      ..write(obj.sunset)
      ..writeByte(1)
      ..write(obj.humidity)
      ..writeByte(2)
      ..write(obj.speed)
      ..writeByte(3)
      ..write(obj.pop)
      ..writeByte(4)
      ..write(obj.day)
      ..writeByte(6)
      ..write(obj.min)
      ..writeByte(7)
      ..write(obj.max)
      ..writeByte(8)
      ..write(obj.night)
      ..writeByte(9)
      ..write(obj.evening)
      ..writeByte(10)
      ..write(obj.morning)
      ..writeByte(11)
      ..write(obj.weatherMessage)
      ..writeByte(12)
      ..write(obj.weatherDescription)
      ..writeByte(13)
      ..write(obj.weatherIcon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayForecastHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
