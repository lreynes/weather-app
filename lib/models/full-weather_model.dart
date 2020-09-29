import 'package:weather_app/models/weather/current-weather_model.dart';
import 'package:weather_app/models/weather/hourly-weather_model.dart';

class FullWeatherModel {
  final CurrentWeatherModel currentWeatherModel;
  final HourlyForcastWeatherModel hourlyForcastWeatherModel;

  FullWeatherModel({this.currentWeatherModel, this.hourlyForcastWeatherModel});
}
