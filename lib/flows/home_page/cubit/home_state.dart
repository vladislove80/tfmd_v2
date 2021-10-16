import 'package:flutter/material.dart';
import 'package:tfmd_v2/flows/home_page/model/forecast_type.dart';
import 'package:tfmd_v2/flows/home_page/model/home_model.dart';

@immutable
class HomeState {
  final bool isLoading;
  final String? errorMessage;
  final HomeModel? model;
  final ForecastType type;

  HomeState({
    this.isLoading = false,
    this.errorMessage,
    this.model,
    this.type = ForecastType.DAYS_FORECAST,
  });

  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    HomeModel? model,
    ForecastType? type,
  }) =>
      HomeState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        model: model ?? this.model,
        type: type ?? this.type,
      );
}
