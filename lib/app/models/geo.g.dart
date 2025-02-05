// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeoDTOAdapter extends TypeAdapter<GeoDTO> {
  @override
  final int typeId = 3;

  @override
  GeoDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoDTO(
      lat: fields[0] as String,
      lng: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GeoDTO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
