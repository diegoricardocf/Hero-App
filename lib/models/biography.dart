
import 'package:hive/hive.dart';

part 'biography.g.dart';

@HiveType(typeId: 2)
class Biography {
  Biography({
    this.fullName,
    this.alterEgos,
    this.aliases,
    this.placeOfBirth,
    this.firstAppearance,
    this.publisher,
    this.alignment,
  });
  @HiveField(0)
  String? fullName;
  @HiveField(1)
  String? alterEgos;
  @HiveField(2)
  List<String>? aliases;
  @HiveField(3)
  String? placeOfBirth;
  @HiveField(4)
  String? firstAppearance;
  @HiveField(5)
  String? publisher;
  @HiveField(6)
  String? alignment;

  factory Biography.fromJson(Map<String, dynamic> json) => Biography(
    fullName: json["full-name"],
    alterEgos: json["alter-egos"],
    aliases: List<String>.from(json["aliases"].map((x) => x)),
    placeOfBirth: json["place-of-birth"] == "null" ? "-" : json["place-of-birth"],
    firstAppearance: json["first-appearance"],
    publisher: json["publisher"]== "null" ? "-" : json["publisher"],
    alignment: json["alignment"]== "null" ? "-" : json["alignment"],
  );
}