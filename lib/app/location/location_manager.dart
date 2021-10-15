import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocationManager {
  LocationManager();

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<List<Placemark>> getCurrentCity(
    double lat,
    double lon,
    String localeIdentifier,
  ) async {
    return await placemarkFromCoordinates(
      lat,
      lon,
      localeIdentifier: localeIdentifier,
    );
  }
}
