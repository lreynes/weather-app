import 'dart:convert';

CurrentWeatherModel currentWeatherModelFromJson(String str) =>
    CurrentWeatherModel.fromJson(json.decode(str)["data"][0]);

class CurrentWeatherModel {
  CurrentWeatherModel({
    this.windCdir,
    this.rh,
    this.pod,
    this.lon,
    this.pres,
    this.timezone,
    this.obTime,
    this.countryCode,
    this.clouds,
    this.vis,
    this.windSpd,
    this.windCdirFull,
    this.appTemp,
    this.stateCode,
    this.ts,
    this.hAngle,
    this.dewpt,
    this.weather,
    this.uv,
    this.aqi,
    this.station,
    this.windDir,
    this.elevAngle,
    this.datetime,
    this.precip,
    this.ghi,
    this.dni,
    this.dhi,
    this.solarRad,
    this.cityName,
    this.sunrise,
    this.sunset,
    this.temp,
    this.lat,
    this.slp,
  });

  String windCdir;
  double rh;
  String pod;
  double lon;
  double pres;
  String timezone;
  String obTime;
  String countryCode;
  int clouds;
  int vis;
  double windSpd;
  String windCdirFull;
  double appTemp;
  String stateCode;
  int ts;
  int hAngle;
  double dewpt;
  Weather weather;
  double uv;
  int aqi;
  String station;
  int windDir;
  double elevAngle;
  String datetime;
  int precip;
  double ghi;
  double dni;
  double dhi;
  double solarRad;
  String cityName;
  String sunrise;
  String sunset;
  double temp;
  double lat;
  double slp;

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherModel(
        windCdir: json["wind_cdir"],
        rh: json["rh"].toDouble(),
        pod: json["pod"],
        lon: json["lon"],
        pres: json["pres"].toDouble(),
        timezone: json["timezone"],
        obTime: json["ob_time"],
        countryCode: json["country_code"],
        clouds: json["clouds"],
        vis: json["vis"],
        windSpd: json["wind_spd"].toDouble(),
        windCdirFull: json["wind_cdir_full"],
        appTemp: json["app_temp"].toDouble(),
        stateCode: json["state_code"],
        ts: json["ts"],
        hAngle: json["h_angle"],
        dewpt: json["dewpt"].toDouble(),
        weather: Weather.fromJson(json["weather"]),
        uv: json["uv"].toDouble(),
        aqi: json["aqi"],
        station: json["station"],
        windDir: json["wind_dir"],
        elevAngle: json["elev_angle"],
        datetime: json["datetime"],
        precip: json["precip"],
        ghi: json["ghi"].toDouble(),
        dni: json["dni"].toDouble(),
        dhi: json["dhi"].toDouble(),
        solarRad: json["solar_rad"].toDouble(),
        cityName: json["city_name"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"].toDouble(),
        lat: json["lat"],
        slp: json["slp"].toDouble(),
      );
}

class Weather {
  Weather({
    this.icon,
    this.code,
    this.description,
  });

  String icon;
  int code;
  String description;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        icon: json["icon"],
        code: json["code"],
        description: json["description"],
      );
}
