import 'package:flutter/material.dart';

@immutable
class AppState {}
class ShowPage extends AppState {
  final bool showSplashScreen;

  ShowPage({required this.showSplashScreen});
}