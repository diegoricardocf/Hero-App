// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appearance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppearanceAdapter extends TypeAdapter<Appearance> {
  @override
  final int typeId = 3;

  @override
  Appearance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Appearance(
      gender: fields[0] as String?,
      race: fields[1] as String?,
      height: (fields[2] as List?)?.cast<String>(),
      weight: (fields[3] as List?)?.cast<String>(),
      eyeColor: fields[4] as String?,
      hairColor: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Appearance obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.gender)
      ..writeByte(1)
      ..write(obj.race)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.eyeColor)
      ..writeByte(5)
      ..write(obj.hairColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppearanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
