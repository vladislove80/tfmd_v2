import 'package:flutter/material.dart';
import 'package:tfmd_v2/flows/home_page/model/home_model.dart';

@immutable
class HomeState {
  final bool isLoading;
  final String? errorMessage;
  final HomeModel? model;

  HomeState({this.isLoading = false, this.errorMessage, this.model});

  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    HomeModel? model,
  }) =>
      HomeState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        model: model ?? this.model,
      );
}
