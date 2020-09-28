import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/request.dart';

class WeatherService {
  Future<CurrentWeatherModel> getCurrentWeatherFromLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    String url = location.getCurrentWeatherUrl(
      location.latitude,
      location.longitude,
    );

    var res = await Request().get(url);
    return currentWeatherModelFromJson(res);
  }

  String getWeatherMainIcon(String condition) {
    if (condition == "01d") {
      return "images/1d.png";
    } else if (condition == "01n") {
      return "images/1n.png";
    } else if (condition == "02d") {
      return "images/2d.png";
    } else if (condition == "02n") {
      return "images/2n.png";
    } else if (condition == "03d") {
      return "images/3dn.png";
    } else if (condition == "03n") {
      return "images/3dn.png";
    } else if (condition == "04d") {
      return "images/4dn.png";
    } else if (condition == "04n") {
      return "images/4dn.png";
    } else if (condition == "09d") {
      return "images/9dn.png";
    } else if (condition == "09n") {
      return "images/9dn.png";
    } else if (condition == "11d") {
      return "images/11d.png";
    } else if (condition == "11n") {
      return "images/11d.png";
    } else if (condition == "13d") {
      return "images/13dn.png";
    } else if (condition == "13n") {
      return "images/13dn.png";
    } else if (condition == "50d") {
      return "images/50dn.png";
    } else if (condition == "50n") {
      return "images/50dn.png";
    } else {
      return "images/other.png";
    }
  }
}
