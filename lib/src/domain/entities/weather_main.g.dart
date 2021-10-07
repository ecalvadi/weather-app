// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherMainAdapter extends TypeAdapter<WeatherMain> {
  @override
  final int typeId = 3;

  @override
  WeatherMain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherMain(
      temp: fields[0] as double,
      feels_like: fields[1] as double,
      temp_min: fields[2] as double,
      temp_max: fields[3] as double,
      pressure: fields[4] as int,
      humidity: fields[5] as int,
      sea_level: fields[6] as int?,
      grnd_level: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherMain obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.temp)
      ..writeByte(1)
      ..write(obj.feels_like)
      ..writeByte(2)
      ..write(obj.temp_min)
      ..writeByte(3)
      ..write(obj.temp_max)
      ..writeByte(4)
      ..write(obj.pressure)
      ..writeByte(5)
      ..write(obj.humidity)
      ..writeByte(6)
      ..write(obj.sea_level)
      ..writeByte(7)
      ..write(obj.grnd_level);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherMainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherMain _$WeatherMainFromJson(Map<String, dynamic> json) => WeatherMain(
      temp: (json['temp'] as num).toDouble(),
      feels_like: (json['feels_like'] as num).toDouble(),
      temp_min: (json['temp_min'] as num).toDouble(),
      temp_max: (json['temp_max'] as num).toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      sea_level: json['sea_level'] as int?,
      grnd_level: json['grnd_level'] as int?,
    );

Map<String, dynamic> _$WeatherMainToJson(WeatherMain instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'sea_level': instance.sea_level,
      'grnd_level': instance.grnd_level,
    };
