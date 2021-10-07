// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CloudAdapter extends TypeAdapter<Cloud> {
  @override
  final int typeId = 6;

  @override
  Cloud read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cloud(
      all: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Cloud obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.all);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CloudAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cloud _$CloudFromJson(Map<String, dynamic> json) => Cloud(
      all: json['all'] as int,
    );

Map<String, dynamic> _$CloudToJson(Cloud instance) => <String, dynamic>{
      'all': instance.all,
    };
