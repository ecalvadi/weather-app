import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'weather_main.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class WeatherMain {
  @HiveField(0)
  final double temp;
  @HiveField(1)
  final double feels_like;
  @HiveField(2)
  final double temp_min;
  @HiveField(3)
  final double temp_max;
  @HiveField(4)
  final int pressure;
  @HiveField(5)
  final int humidity;
  @HiveField(6)
  final int? sea_level;
  @HiveField(7)
  final int? grnd_level;

  WeatherMain({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
    this.sea_level,
    this.grnd_level,
  });

  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherMainToJson(this);
}
