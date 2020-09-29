import 'package:flutter/material.dart';
import 'package:weather_app/models/full-weather_model.dart';
import 'package:weather_app/models/weather/current-weather_model.dart';
import 'package:weather_app/models/weather/hourly-weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherAppScreen extends StatefulWidget {
  final FullWeatherModel fullWeather;

  WeatherAppScreen({@required this.fullWeather});

  @override
  _WeatherAppScreenState createState() => _WeatherAppScreenState();
}

class _WeatherAppScreenState extends State<WeatherAppScreen> {
  CurrentWeatherModel currentWeatherData;
  HourlyForcastWeatherModel hourlyForcastData;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentWeatherData = widget.fullWeather.currentWeatherModel;
      hourlyForcastData = widget.fullWeather.hourlyForcastWeatherModel;
    });
  }

  String addCorrectUTC(String hour) {
    List<String> splittedHour = hour.split(':');
    return (int.parse(splittedHour[0]) + 2).toString() + ':' + splittedHour[1];
  }

  List<Widget> generateCardFromHourlyForcastData() {
    return hourlyForcastData.data
        .map((hourlyForcast) => HourlyForcastWeatherCard(
              iconUrl: hourlyForcast.weather.icon,
              hour: hourlyForcast.timestampLocal.hour.toString() + ':00',
              temp: hourlyForcast.temp.truncate(),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 18, right: 18, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${currentWeatherData.cityName},',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('France',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  )),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    "Aujourd'hui",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    WeatherService()
                        .getWeatherMainIcon(currentWeatherData.weather.icon),
                    height: 160.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${currentWeatherData.appTemp.truncate()}',
                              style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '°C',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          currentWeatherData.weather.description,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconInformationWidget(
                    imagePath: 'images/icn/icn_sunrise.png',
                    data: addCorrectUTC(currentWeatherData.sunrise),
                  ),
                  IconInformationWidget(
                    imagePath: 'images/icn/icn_sunset.png',
                    data: addCorrectUTC(currentWeatherData.sunset),
                  ),
                  IconInformationWidget(
                    imagePath: 'images/icn/icn_wind.png',
                    data: '${currentWeatherData.windSpd.truncate()}km/h',
                  ),
                  IconInformationWidget(
                    imagePath: 'images/icn/icn_humidity.png',
                    data: '${currentWeatherData.rh.truncate()}%',
                  ),
                ],
              ),
              Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Aujourd'hui",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '7 prochains jours >',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: ListView(
                  padding: EdgeInsets.only(top: 12, bottom: 4),
                  scrollDirection: Axis.horizontal,
                  children: generateCardFromHourlyForcastData().toList(),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class HourlyForcastWeatherCard extends StatelessWidget {
  final String hour;
  final String iconUrl;
  final int temp;

  const HourlyForcastWeatherCard({
    @required this.hour,
    @required this.iconUrl,
    @required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: 50.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            hour,
            style: TextStyle(color: Colors.grey),
          ),
          Image.network(
            'https://www.weatherbit.io/static/img/icons/$iconUrl.png',
            height: 40,
          ),
          Text(
            '$temp°',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class IconInformationWidget extends StatelessWidget {
  const IconInformationWidget({
    @required this.imagePath,
    @required this.data,
  });

  final String imagePath;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath, height: 50),
        Container(
          margin: EdgeInsets.only(top: 4),
          child: Text(data),
        ),
      ],
    );
  }
}
