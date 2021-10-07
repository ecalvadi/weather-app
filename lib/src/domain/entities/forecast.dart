import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

import 'package:weather_app/src/domain/entities/coord.dart';
import 'package:weather_app/src/domain/entities/weather.dart';
import 'package:weather_app/src/domain/entities/weather_main.dart';
import 'package:weather_app/src/domain/entities/wind.dart';
import 'package:weather_app/src/domain/entities/cloud.dart';
import 'package:weather_app/src/domain/entities/weather_sys.dart';

part 'forecast.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Forecast {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final List<Weather>? weather;
  @HiveField(2)
  final String? base;
  @HiveField(3)
  final WeatherMain? main;
  @HiveField(4)
  final int? visibility;
  @HiveField(5)
  final Wind? wind;
  @HiveField(6)
  final Cloud? clouds;
  @HiveField(7)
  final int? dt;
  //final WeatherSys? sys;
  @HiveField(8)
  final int? timezone;
  @HiveField(9)
  final Coord? coord;
  @HiveField(10)
  final String? name;
  @HiveField(11)
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
    //this.sys,
    this.timezone,
    required this.id,
    this.name,
    this.cod,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
