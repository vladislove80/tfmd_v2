import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:tfmd_v2/app/location/location_manager.dart';

@lazySingleton
class LocationRepository {
  final _locationManager = GetIt.instance.get<LocationManager>();

  Future<LocationData?> getCurrentUserLocation() =>  _locationManager.getCurrentLocation();
}
