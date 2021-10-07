import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'coord.g.dart';

@HiveType(typeId: 9)
@JsonSerializable()
class Coord {
  @HiveField(0)
  final double lon;
  @HiveField(1)
  final double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  @override
  String toString() => 'lat: $lat, lon: $lon';

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}
