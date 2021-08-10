import 'package:hero_app/models/powerstats.dart';
import 'package:hive/hive.dart';

import 'appearance.dart';
import 'biography.dart';
import 'image_hero.dart';

part 'super_hero.g.dart';

@HiveType(typeId: 0)
class SuperHero extends HiveObject {
  SuperHero({
    this.id,
    this.name,
    this.powerstats,
    this.biography,
    this.appearance,
    this.image,
  });

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  Powerstats? powerstats;
  @HiveField(3)
  Biography? biography;
  @HiveField(4)
  Appearance? appearance;
  @HiveField(5)
  ImageHero? image;

  factory SuperHero.fromJson(Map<String, dynamic> json) => SuperHero(
        id: json["id"],
        name: json["name"],
        powerstats: Powerstats.fromJson(json["powerstats"]),
        biography: Biography.fromJson(json["biography"]),
        appearance: Appearance.fromJson(json["appearance"]),
        image: ImageHero.fromJson(json["image"]),
      );
}
