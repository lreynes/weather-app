import 'dart:convert';

HourlyForcastWeatherModel hourlyWeatherModelFromJson(String str) =>
    HourlyForcastWeatherModel.fromJson(json.decode(str));

class HourlyForcastWeatherModel {
  HourlyForcastWeatherModel({
    this.data,
    this.cityName,
    this.lon,
    this.timezone,
    this.lat,
    this.countryCode,
    this.stateCode,
  });

  List<Datum> data;
  String cityName;
  double lon;
  String timezone;
  double lat;
  String countryCode;
  String stateCode;

  factory HourlyForcastWeatherModel.fromJson(Map<String, dynamic> json) =>
      HourlyForcastWeatherModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        cityName: json["city_name"],
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        lat: json["lat"].toDouble(),
        countryCode: json["country_code"],
        stateCode: json["state_code"],
      );
}

class Datum {
  Datum({
    this.timestampLocal,
    this.timestampUtc,
    this.ts,
    this.datetime,
    this.windGustSpd,
    this.windSpd,
    this.windDir,
    this.windCdir,
    this.windCdirFull,
    this.temp,
    this.appTemp,
    this.pop,
    this.precip,
    this.snow,
    this.snowDepth,
    this.slp,
    this.pres,
    this.dewpt,
    this.rh,
    this.weather,
    this.pod,
    this.cloudsLow,
    this.cloudsMid,
    this.cloudsHi,
    this.clouds,
    this.vis,
    this.dhi,
    this.dni,
    this.ghi,
    this.solarRad,
    this.uv,
    this.ozone,
  });

  DateTime timestampLocal;
  DateTime timestampUtc;
  double ts;
  String datetime;
  double windGustSpd;
  double windSpd;
  double windDir;
  String windCdir;
  String windCdirFull;
  double temp;
  double appTemp;
  double pop;
  double precip;
  double snow;
  double snowDepth;
  double slp;
  double pres;
  double dewpt;
  double rh;
  Weather weather;
  String pod;
  double cloudsLow;
  double cloudsMid;
  double cloudsHi;
  double clouds;
  double vis;
  double dhi;
  double dni;
  double ghi;
  double solarRad;
  double uv;
  double ozone;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        timestampLocal: DateTime.parse(json["timestamp_local"]),
        timestampUtc: DateTime.parse(json["timestamp_utc"]),
        ts: json["ts"].toDouble(),
        datetime: json["datetime"],
        windGustSpd: json["wind_gust_spd"].toDouble(),
        windSpd: json["wind_spd"].toDouble(),
        windDir: json["wind_dir"].toDouble(),
        windCdir: json["wind_cdir"],
        windCdirFull: json["wind_cdir_full"],
        temp: json["temp"].toDouble(),
        appTemp: json["app_temp"].toDouble(),
        pop: json["pop"].toDouble(),
        precip: json["precip"].toDouble(),
        snow: json["snow"].toDouble(),
        snowDepth: json["snow_depth"].toDouble(),
        slp: json["slp"].toDouble(),
        pres: json["pres"].toDouble(),
        dewpt: json["dewpt"].toDouble(),
        rh: json["rh"].toDouble(),
        weather: Weather.fromJson(json["weather"]),
        pod: json["pod"],
        cloudsLow: json["clouds_low"].toDouble(),
        cloudsMid: json["clouds_mid"].toDouble(),
        cloudsHi: json["clouds_hi"].toDouble(),
        clouds: json["clouds"].toDouble(),
        vis: json["vis"].toDouble(),
        dhi: json["dhi"].toDouble(),
        dni: json["dni"].toDouble(),
        ghi: json["ghi"].toDouble(),
        solarRad: json["solar_rad"].toDouble(),
        uv: json["uv"].toDouble(),
        ozone: json["ozone"].toDouble(),
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
