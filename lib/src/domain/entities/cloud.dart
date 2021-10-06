import 'package:json_annotation/json_annotation.dart';

part 'cloud.g.dart';

@JsonSerializable()
class Cloud {
  final int all;

  Cloud({required this.all});

  factory Cloud.fromJson(Map<String, dynamic> json) => _$CloudFromJson(json);

  Map<String, dynamic> toJson() => _$CloudToJson(this);
}
