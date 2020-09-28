import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${locationWeatherData.name},',
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
                    WeatherService().getWeatherMainIcon(
                        locationWeatherData.weather[0].icon),
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
                              '${locationWeatherData.main.temp.truncate()}',
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
                          locationWeatherData.weather[0].description,
                          style: TextStyle(
                            fontSize: 14,
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
                    imagePath: 'images/icn/icn_temp-min.png',
                    data: '${locationWeatherData.main.tempMin.truncate()}°C',
                  ),
                  IconInformationWidget(
                    imagePath: 'images/icn/icn_temp-max.png',
                    data: '${locationWeatherData.main.tempMax.truncate()}°C',
                  ),
                  IconInformationWidget(
                    imagePath: 'images/icn/wind-icn.png',
                    data: '${locationWeatherData.wind.speed.truncate()}km/h',
                  ),
                  IconInformationWidget(
                    imagePath: 'images/icn/humidity-icn.png',
                    data: '${locationWeatherData.main.humidity.truncate()}%',
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
                    Container(
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
                            '10:00',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Image.asset(
                            'images/icn/icn_sunny.png',
                            height: 40,
                          ),
                          Text(
                            '20°',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
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
                          Image.asset(
                            WeatherService().getWeatherMainIcon(
                                locationWeatherData.weather[0].icon),
                            height: 30,
                          ),
                          Text(
                            '20°',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            '12:00',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Image.asset(
                            'images/icn/icn_sunny.png',
                            height: 40,
                          ),
                          Text(
                            '22°',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            '13:00',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Image.asset(
                            'images/icn/icn_sunny.png',
                            height: 40,
                          ),
                          Text(
                            '21°',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            '14:00',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Image.asset(
                            'images/icn/icn_sunny.png',
                            height: 40,
                          ),
                          Text(
                            '19°',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
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
