import 'package:json_annotation/json_annotation.dart';

part 'coord.g.dart';

@JsonSerializable()
class Coord {
  final double lon;
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
