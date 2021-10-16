class WeatherResponse {
  final City? city;
  final List<DayForecast>? forecastList;

  WeatherResponse({this.city, this.forecastList});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    var forecastJson = json["list"];
    final isList = forecastJson is List;
    final forecastList = isList
        ? (forecastJson as List)
            .map(
              (forecast) => DayForecast.fromJson(forecast),
            )
            .toList()
        : null;

    return WeatherResponse(
      city: City.fromJson(json["city"]),
      forecastList: forecastList,
    );
  }
}

class City {
  final String? name;
  final Coord? coord;
  final String? country;

  //todo decouple daily and hour response
  final int? sunrise;
  final int? sunset;

  City({
    this.name,
    this.coord,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
        coord: Coord.fromJson(json["coord"]),
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );
}

class Coord {
  final double? lon;
  final double? lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"],
        lat: json["lat"],
      );
}

class DayForecast {
  final int? date;
  final int? sunrise;
  final int? sunset;
  final Temperature? temp;
  final int? humidity;
  final List<WeatherMessage>? weather;
  final double? speed;
  final double? pop;
  final Main? main;

  //todo decouple daily and hour response
  final String? dtText;

  DayForecast({
    this.date,
    this.sunrise,
    this.sunset,
    this.temp,
    this.humidity,
    this.weather,
    this.speed,
    this.pop,
    this.main,
    this.dtText,
  });

  factory DayForecast.fromJson(Map<String, dynamic> json) => DayForecast(
        date: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"] == null ? null : Temperature.fromJson(json["temp"]),
        humidity: json["humidity"],
        weather: json["weather"] == null || !(json["weather"] is List)
            ? null
            : (json["weather"] as List)
                .map((e) => WeatherMessage.fromJson(e))
                .toList(),
        //todo decouple daily and hour response
        speed: json["speed"] == null ? json["wind"]["speed"] : json["speed"],
        pop: json["pop"] is int ? (json["pop"] as int).toDouble() : json["pop"],
        main: json["main"] == null ? null : Main.fromJson(json["main"]),
        dtText: json["dt_txt"],
      );
}

class WeatherMessage {
  final String? main;
  final String? description;
  final String? icon;

  WeatherMessage({this.main, this.description, this.icon});

  factory WeatherMessage.fromJson(Map<String, dynamic> json) => WeatherMessage(
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );
}

class Temperature {
  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? evening;
  final double? morning;

  Temperature({
    this.day,
    this.min,
    this.max,
    this.night,
    this.evening,
    this.morning,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
        day: json["day"],
        min: json["min"],
        max: json["max"],
        night: json["night"],
        evening: json["eve"],
        morning: json["morn"],
      );
}

class Main {
  final double? temp;
  final double? min;
  final double? max;
  final int? humidity;

  Main({this.temp, this.min, this.max, this.humidity});

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"],
        min: json["temp_min"],
        max: json["temp_max"],
        humidity: json["humidity"],
      );
}
