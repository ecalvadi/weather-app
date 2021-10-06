import 'package:json_annotation/json_annotation.dart';

import 'package:weather_app/src/domain/entities/coord.dart';
import 'package:weather_app/src/domain/entities/weather.dart';
import 'package:weather_app/src/domain/entities/weather_main.dart';
import 'package:weather_app/src/domain/entities/wind.dart';
import 'package:weather_app/src/domain/entities/cloud.dart';
import 'package:weather_app/src/domain/entities/weather_sys.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final WeatherMain main;
  final int visibility;
  final Wind wind;
  final Cloud clouds;
  final int dt;
  final WeatherSys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  Forecast({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
