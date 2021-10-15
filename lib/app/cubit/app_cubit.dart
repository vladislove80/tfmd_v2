import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tfmd_v2/app/cubit/app_state.dart';
import 'package:tfmd_v2/app/injectible/injectible_init.dart';
import 'package:tfmd_v2/app/prefs/prefs.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState()) {
    _init();
  }

  Future<void> _init() async {
    configureDependencies();
    final prefs = GetIt.instance.get<Prefs>();
    emit(ShowPage(isSplashPageShown: await prefs.isSplashPageShown()));
    await prefs.setSplashPageIsShown();
  }
}
