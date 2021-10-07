import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'cloud.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class Cloud {
  @HiveField(0)
  final int all;

  Cloud({required this.all});

  factory Cloud.fromJson(Map<String, dynamic> json) => _$CloudFromJson(json);

  Map<String, dynamic> toJson() => _$CloudToJson(this);
}
