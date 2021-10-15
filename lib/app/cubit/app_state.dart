import 'package:flutter/material.dart';

@immutable
class AppState {}

class ShowPage extends AppState {
  final bool isSplashPageShown;

  ShowPage({required this.isSplashPageShown});
}
