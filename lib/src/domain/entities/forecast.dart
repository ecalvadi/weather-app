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
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final WeatherMain? main;
  final int? visibility;
  final Wind? wind;
  final Cloud? clouds;
  final int? dt;
  final WeatherSys? sys;
  final int? timezone;
  final int id;
  final String? name;
  final int? cod;

  Forecast({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    required this.id,
    this.name,
    this.cod,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
