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

  City({this.name, this.coord, this.country});

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
        coord: Coord.fromJson(json["coord"]),
        country: json["country"],
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
  final double? rain;

  DayForecast({
    this.date,
    this.sunrise,
    this.sunset,
    this.temp,
    this.humidity,
    this.weather,
    this.speed,
    this.rain,
  });

  factory DayForecast.fromJson(Map<String, dynamic> json) => DayForecast(
        date: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: Temperature.fromJson(json["temp"]),
        humidity: json["humidity"],
        weather: json["weather"] == null
            ? null
            : (json["weather"] as List)
                .map((e) => WeatherMessage.fromJson(e))
                .toList(),
        speed: json["speed"],
        rain: json["pop"],
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
