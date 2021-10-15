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
      city: json["name"],
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
        coord: json["coord"],
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
  final double? date;

  final double? temp;
  final double? humidity;
  final WeatherMessage? weather;
  final double? speed;
  final double? rain;

  DayForecast({
    this.date,
    this.temp,
    this.humidity,
    this.weather,
    this.speed,
    this.rain,
  });

  factory DayForecast.fromJson(Map<String, dynamic> json) => DayForecast(
        date: json["date"],
        temp: json["temp"],
        humidity: json["humidity"],
        weather: json["weather"],
        speed: json["speed"],
        rain: json["rain"],
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
        evening: json["evening"],
        morning: json["morning"],
      );
}