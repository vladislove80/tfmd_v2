import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tfmd_v2/app/location/location_manager.dart';

@lazySingleton
class LocationRepository {
  final _locationManager = GetIt.instance.get<LocationManager>();

  Future<Position?> getCurrentUserLocation() =>
      _locationManager.determinePosition();

  Future<List<Placemark>> getCurrentCity(double lat, double lon, String localeIdentifier) =>
      _locationManager.getCurrentCity(lat, lon, localeIdentifier);
}
