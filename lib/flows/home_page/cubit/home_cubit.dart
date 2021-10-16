import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tfmd_v2/flows/home_page/cubit/home_state.dart';
import 'package:tfmd_v2/flows/home_page/home_interactor.dart';
import 'package:tfmd_v2/flows/home_page/model/forecast_type.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(isLoading: true));

  final _interactor = GetIt.instance.get<HomeInteractor>();

  Future<void> init() async {
    final model = await _interactor.getData();
    emit(
      state.copyWith(
        isLoading: false,
        model: model,
      ),
    );
  }

  Future<void> switchForecastType(ForecastType value) async {
    emit(state.copyWith(isLoading: true));
    final model = await _interactor.getData(type: value);
    emit(
      state.copyWith(
        isLoading: false,
        model: model,
        type: value,
      ),
    );
  }
}
