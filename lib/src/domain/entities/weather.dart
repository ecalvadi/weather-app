import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Weather {
  @HiveField(0)
  final int id;
  @HiveField(2)
  final String main;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  String toString() => "ID: $id, Description: $description";

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
