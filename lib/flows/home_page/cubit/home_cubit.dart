import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tfmd_v2/flows/home_page/cubit/home_state.dart';
import 'package:tfmd_v2/flows/home_page/home_interactor.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  final _interactor = GetIt.instance.get<HomeInteractor>();

  Future<void> init() async {
    final location = await _interactor.getCurrentUserLocation();
    print(location);
  }
}
