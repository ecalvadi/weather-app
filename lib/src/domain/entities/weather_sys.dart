import 'package:json_annotation/json_annotation.dart';

part 'weather_sys.g.dart';

@JsonSerializable()
class WeatherSys {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  WeatherSys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherSys.fromJson(Map<String, dynamic> json) =>
      _$WeatherSysFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherSysToJson(this);
}
