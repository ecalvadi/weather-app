// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_sys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherSys _$WeatherSysFromJson(Map<String, dynamic> json) => WeatherSys(
      type: json['type'] as int,
      id: json['id'] as int,
      country: json['country'] as String,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
    );

Map<String, dynamic> _$WeatherSysToJson(WeatherSys instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
