// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biography.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BiographyAdapter extends TypeAdapter<Biography> {
  @override
  final int typeId = 2;

  @override
  Biography read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Biography(
      fullName: fields[0] as String?,
      alterEgos: fields[1] as String?,
      aliases: (fields[2] as List?)?.cast<String>(),
      placeOfBirth: fields[3] as String?,
      firstAppearance: fields[4] as String?,
      publisher: fields[5] as String?,
      alignment: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Biography obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.alterEgos)
      ..writeByte(2)
      ..write(obj.aliases)
      ..writeByte(3)
      ..write(obj.placeOfBirth)
      ..writeByte(4)
      ..write(obj.firstAppearance)
      ..writeByte(5)
      ..write(obj.publisher)
      ..writeByte(6)
      ..write(obj.alignment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BiographyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
