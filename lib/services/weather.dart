import 'package:weather_app/models/weather/current-weather_model.dart';
import 'package:weather_app/models/weather/hourly-weather_model.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/request.dart';

class WeatherService {
  final location = Location();

  Future<CurrentWeatherModel> getCurrentWeatherFromPosition(
    double lat,
    double lon,
  ) async {
    String url = location.getCurrentWeatherUrl(lat, lon);

    var res = await Request().get(url);
    return currentWeatherModelFromJson(res);
  }

  Future<HourlyForcastWeatherModel> getHourlyForcastWeatherFromPosition(
    double lat,
    double lon,
  ) async {
    String url = location.getHourlyForcastWeatherUrl(lat, lon);

    var res = await Request().get(url);
    return hourlyWeatherModelFromJson(res);
  }

  String getWeatherMainIcon(String condition) {
    if (condition == "c01d") {
      return "images/1d.png";
    } else if (condition == "c01n") {
      return "images/1n.png";
    } else if (condition == "c02d") {
      return "images/2d.png";
    } else if (condition == "c02n") {
      return "images/2n.png";
    } else if (condition == "c03d" || condition == "c03n") {
      return "images/3dn.png";
    } else if (condition == "c04d" || condition == "c04n") {
      return "images/4dn.png";
    } else if (condition.substring(0, 1) == "r0") {
      return "images/9dn.png";
    } else if (condition.substring(0, 1) == "f0") {
      return "images/10dn.png";
    } else if (condition.substring(0, 1) == "t0" && condition.endsWith("d")) {
      return "images/11d.png";
    } else if (condition.substring(0, 1) == "t0" && condition.endsWith("n")) {
      return "images/11d.png";
    } else if (condition.substring(0, 1) == "s0") {
      return "images/13dn.png";
    } else if (condition.substring(0, 1) == "a0") {
      return "images/50dn.png";
    } else {
      return "images/other.png";
    }
  }
}
