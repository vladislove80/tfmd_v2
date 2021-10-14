import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfmd_v2/app/cubit/app_state.dart';
import 'package:tfmd_v2/app/injectible/injectible_init.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState()) {
    _init();
  }

  Future<void> _init() async {
    configureDependencies();
    //todo check if user first time launch the app
    emit(ShowPage(showSplashScreen: true));
  }
}
