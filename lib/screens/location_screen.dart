import 'package:flutter/material.dart';
import 'package:weather_app/models/weather/current-weather_model.dart';
import 'package:weather_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final CurrentWeatherModel currentWeather;

  LocationScreen({this.currentWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  CurrentWeatherModel locationWeatherData;

  @override
  void initState() {
    super.initState();
    setState(() {
      locationWeatherData = widget.currentWeather;
    });
  }

  String addCorrectUTC(String hour) {
    List<String> splittedHour = hour.split(':');
    return (int.parse(splittedHour[0]) + 2).toString() + ':' + splittedHour[1];
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
                '${locationWeatherData.cityName},',
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
                        .getWeatherMainIcon(locationWeatherData.weather.icon),
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
                              '${locationWeatherData.appTemp.truncate()}',
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
                          locationWeatherData.weather.description,
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
                    data: addCorrectUTC(locationWeatherData.sunrise),
                  ),
                  IconInformationWidget(
                    imagePath: 'images/icn/icn_sunset.png',
                    data: addCorrectUTC(locationWeatherData.sunset),
                  ),
                  IconInformationWidget(
                    imagePath: 'images/icn/icn_wind.png',
                    data: '${locationWeatherData.windSpd.truncate()}km/h',
                  ),
                  IconInformationWidget(
                    imagePath: 'images/icn/icn_humidity.png',
                    data: '${locationWeatherData.rh.truncate()}%',
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
                  children: [
                    HourForcastWeatherCard(
                      iconUrl: 'images/icn/icn_sunny.png',
                      hour: '10:00',
                      temp: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      width: 50.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF92BBF8),
                            Color(0xFF92BBF8),
                            Color(0xFF327EF1),
                          ],
                        ),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '11:00',
                            style: TextStyle(color: Colors.white),
                          ),
                          Image.network(
                            'https://www.weatherbit.io/static/img/icons/${locationWeatherData.weather.icon}.png',
                            height: 30,
                          ),
                          Text(
                            '20°',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    HourForcastWeatherCard(
                      iconUrl: 'images/icn/icn_sunny.png',
                      hour: '12:00',
                      temp: 24,
                    ),
                    HourForcastWeatherCard(
                      iconUrl: 'images/icn/icn_sunny.png',
                      hour: '13:00',
                      temp: 23,
                    ),
                    HourForcastWeatherCard(
                      iconUrl: 'images/icn/icn_sunny.png',
                      hour: '14:00',
                      temp: 20,
                    ),
                    HourForcastWeatherCard(
                      iconUrl: 'images/icn/icn_sunny.png',
                      hour: '15:00',
                      temp: 19,
                    ),
                  ],
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

class HourForcastWeatherCard extends StatelessWidget {
  final String hour;
  final String iconUrl;
  final int temp;

  const HourForcastWeatherCard({
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
          Image.asset(
            iconUrl,
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
