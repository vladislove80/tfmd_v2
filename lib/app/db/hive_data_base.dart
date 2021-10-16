import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:tfmd_v2/app/db/home_hive_model.dart';
import 'package:tfmd_v2/flows/home_page/model/home_model.dart';

@lazySingleton
class HiveDataBase {
  static const HOME_BOX = 'homeBox';
  static const HOME_MODEL = 'homeModel';

  Box<HomeHiveModel>? box;

  HiveDataBase() {
    _init();
  }

  void _init() async {
    Hive.registerAdapter(HomeHiveModelAdapter());
    box = await Hive.openBox<HomeHiveModel>(HOME_BOX);
  }

  Future<void> saveHomeModel(HomeHiveModel model) async {
    if (box == null) box = await Hive.openBox<HomeHiveModel>(HOME_BOX);
    box?.put(HOME_MODEL, model);
  }

  Future<HomeModel?> getHomeModel() async {
    if (box == null) box = await Hive.openBox<HomeHiveModel>(HOME_BOX);
    final homeHiveModel = box?.get(HOME_MODEL);
    return mapHiveToHome(homeHiveModel);
  }

  void deleteModel() => box?.delete(HOME_MODEL);

  static HomeHiveModel mapHomeToHive(HomeModel model) => HomeHiveModel(
        latitude: model.latitude,
        longitude: model.longitude,
        city: model.city,
        dayForecast: DayForecastHiveModel.fromModel(model.dayForecast),
      );

  static HomeModel? mapHiveToHome(HomeHiveModel? model) => HomeModel(
        latitude: model?.latitude,
        longitude: model?.longitude,
        city: model?.city,
        dayForecast: HomeModel.fromForecastHiveModel(model?.dayForecast),
      );
}
