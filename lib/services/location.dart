import 'package:geolocator/geolocator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Location {
  final apiKey = DotEnv().env['WEATHER_TOKEN'];
  final String baseUrl = 'https://api.weatherbit.io/v2.0/current ';
  double longitude;
  double latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }

  String getCurrentWeatherUrl(double lat, double lon) {
    return '$baseUrl?key=$apiKey&units=m&lang=fr&lat=$lat&lon=$lon';
  }
}
