import 'package:tfmd_v2/common/app_string.dart';

enum ForecastType {
  HOUR_FORECAST,
  DAYS_FORECAST,
}

extension Forecast on ForecastType {
  String get label {
    switch (this) {
      case ForecastType.HOUR_FORECAST:
        return AppString.hours;
      case ForecastType.DAYS_FORECAST:
        return AppString.days;
    }
  }

  static ForecastType value(String label) {
    switch (label) {
      case AppString.hours:
        return ForecastType.HOUR_FORECAST;
      case AppString.days:
        return ForecastType.DAYS_FORECAST;
      default:
        return ForecastType.DAYS_FORECAST;
    }
  }
}
