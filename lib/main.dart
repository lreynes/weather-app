import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/models/full-weather_model.dart';
import 'package:weather_app/screens/weather-app_screen.dart';
import 'package:weather_app/services/weather_service.dart';

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

class WeatherAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WeatherService().getFullWeatherFromPosition(),
      builder: (context, AsyncSnapshot<FullWeatherModel> snapshot) {
        if (snapshot.hasData)
          return WeatherAppScreen(fullWeather: snapshot.data);
        else if (snapshot.hasError)
          return Text('Erreur');
        else {
          return Scaffold(
            body: Center(
              child: SpinKitDoubleBounce(
                color: Colors.black12,
                size: 100.0,
              ),
            ),
          );
        }
      },
    );
  }
}
