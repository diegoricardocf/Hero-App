import 'package:hive/hive.dart';

part 'appearance.g.dart';

@HiveType(typeId: 3)
class Appearance {
  Appearance({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  });

  @HiveField(0)
  String? gender;
  @HiveField(1)
  String? race;
  @HiveField(2)
  List<String>? height;
  @HiveField(3)
  List<String>? weight;
  @HiveField(4)
  String? eyeColor;
  @HiveField(5)
  String? hairColor;

  factory Appearance.fromJson(Map<String, dynamic> json) => Appearance(
        gender: json["gender"],
        race: json["race"] == "null" ? "-" : json["race"],
        height: List<String>.from(json["height"].map((x) => x)),
        weight: List<String>.from(json["weight"].map((x) => x)),
        eyeColor: json["eye-color"],
        hairColor: json["hair-color"],
      );
}
