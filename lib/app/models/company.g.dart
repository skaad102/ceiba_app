// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyDTOAdapter extends TypeAdapter<CompanyDTO> {
  @override
  final int typeId = 4;

  @override
  CompanyDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyDTO(
      name: fields[0] as String,
      catchPhrase: fields[1] as String,
      bs: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyDTO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.catchPhrase)
      ..writeByte(2)
      ..write(obj.bs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
