class AppUrl {
  static const weatherUrl =
      'https://community-open-weather-map.p.rapidapi.com/forecast';
  static const daily = '/daily';

  static String getWeatherIconUrl(String path) =>
      'http://openweathermap.org/img/wn/$path@2x.png';
}
