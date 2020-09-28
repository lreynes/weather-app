import 'package:geolocator/geolocator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Location {
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final apiKey = DotEnv().env['WEATHER_TOKEN'];
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
    return '$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=fr';
  }
}
