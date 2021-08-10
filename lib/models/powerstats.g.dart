// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'powerstats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PowerstatsAdapter extends TypeAdapter<Powerstats> {
  @override
  final int typeId = 1;

  @override
  Powerstats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Powerstats(
      intelligence: fields[0] as String?,
      strength: fields[1] as String?,
      speed: fields[2] as String?,
      durability: fields[3] as String?,
      power: fields[4] as String?,
      combat: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Powerstats obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.intelligence)
      ..writeByte(1)
      ..write(obj.strength)
      ..writeByte(2)
      ..write(obj.speed)
      ..writeByte(3)
      ..write(obj.durability)
      ..writeByte(4)
      ..write(obj.power)
      ..writeByte(5)
      ..write(obj.combat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PowerstatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
