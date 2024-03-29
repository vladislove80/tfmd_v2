import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tfmd_v2/app/api/api.dart';
import 'package:tfmd_v2/app/model/response/weather_response.dart';
import 'package:tfmd_v2/common/app_url.dart';
import 'package:tfmd_v2/flows/home_page/model/forecast_type.dart';

@lazySingleton
class RemoteRepository {
  static const HOST = 'community-open-weather-map.p.rapidapi.com';
  static const KEY = "d74df8401cmshc863bf47f26bbaap14421cjsn36f43864746b";
  static const UNITS = "metric";
  static const DAY_AMOUNT = 10;

  RemoteRepository(this._apiManager);

  final ApiManager _apiManager;
  final Options options = Options(
    method: 'GET',
    contentType: 'application/json',
    headers: {'X-RapidAPI-Host': HOST, 'X-RapidAPI-Key': KEY},
  );

  Future<WeatherResponse> getWeatherForecast(
    double lat,
    double lng,
    String countryWithCode, {
    ForecastType type = ForecastType.DAYS_FORECAST,
  }) async {
    final response = await _apiManager.get(
      path: AppUrl.weatherUrl +
          _getUrlType(type) +
          '?lat=$lat&lon=$lng&cnt=$DAY_AMOUNT&units=$UNITS&lang=$countryWithCode',
      options: options,
    );

    if (response.data != null && response.data.data != null) {
      return WeatherResponse.fromJson(response.data.data);
    }

    throw response.error ?? Exception();
  }

  Future<WeatherResponse> getKyivWeatherForecast(
    String countryWithCode, {
    ForecastType type = ForecastType.DAYS_FORECAST,
  }) async {
    final response = await _apiManager.get(
      path: AppUrl.weatherUrl +
          _getUrlType(type) +
          '?q=kyiv&id=2172797&lang=null&units=metric&mode=json&lang=$countryWithCode',
      options: options,
    );

    if (response.data != null && response.data.data != null) {
      return WeatherResponse.fromJson(response.data.data);
    }

    throw response.error ?? Exception();
  }

  String _getUrlType(ForecastType value) =>
      (value == ForecastType.DAYS_FORECAST ? AppUrl.daily : '');
}
