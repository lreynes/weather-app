import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/location_model.dart';

class LocationService {
  Future<Location> getCurrentLocation() async {
    try {
      Position position = await getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      return Location(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      print(e);
    }
  }
}
