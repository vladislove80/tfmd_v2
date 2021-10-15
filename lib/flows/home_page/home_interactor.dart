import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:tfmd_v2/data/location_repository.dart';

@singleton
class HomeInteractor {
  final LocationRepository _locationManager;

  HomeInteractor(this._locationManager);

  Future<LocationData?> getCurrentUserLocation() =>
      _locationManager.getCurrentUserLocation();
}
