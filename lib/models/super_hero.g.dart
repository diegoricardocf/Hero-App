// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'super_hero.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuperHeroAdapter extends TypeAdapter<SuperHero> {
  @override
  final int typeId = 0;

  @override
  SuperHero read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SuperHero(
      id: fields[0] as String?,
      name: fields[1] as String?,
      powerstats: fields[2] as Powerstats?,
      biography: fields[3] as Biography?,
      appearance: fields[4] as Appearance?,
      image: fields[5] as ImageHero?,
    );
  }

  @override
  void write(BinaryWriter writer, SuperHero obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.powerstats)
      ..writeByte(3)
      ..write(obj.biography)
      ..writeByte(4)
      ..write(obj.appearance)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuperHeroAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
