import 'package:hive/hive.dart';

part 'powerstats.g.dart';

@HiveType(typeId: 1)
class Powerstats {
  Powerstats({
    this.intelligence ,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  @HiveField(0)
  String? intelligence;
  @HiveField(1)
  String? strength;
  @HiveField(2)
  String? speed;
  @HiveField(3)
  String? durability;
  @HiveField(4)
  String? power;
  @HiveField(5)
  String? combat;

  factory Powerstats.fromJson(Map<String, dynamic> json) => Powerstats(
    intelligence: json["intelligence"] == "null" ? "-" : json["intelligence"],
    strength: json["strength"] == "null" ? "-" : json["strength"],
    speed: json["speed"] == "null" ? "-" : json["speed"],
    durability: json["durability"] == "null" ? "-" : json["durability"],
    power: json["power"] == "null" ? "-" : json["power"],
    combat: json["combat"] == "null" ? "-" : json["combat"],
  );
}