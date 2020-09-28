import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

main() async {
  await DotEnv().load('.env');
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherAppPage(),
    );
  }
}

class WeatherAppPage extends StatefulWidget {
  @override
  _WeatherAppPageState createState() => _WeatherAppPageState();
}

class _WeatherAppPageState extends State<WeatherAppPage> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var currentWeatherData =
        await WeatherService().getCurrentWeatherFromLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        currentWeather: currentWeatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black12,
          size: 100.0,
        ),
      ),
    );
  }
}
