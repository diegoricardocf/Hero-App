import 'package:hive/hive.dart';

part 'image_hero.g.dart';

@HiveType(typeId: 4)
class ImageHero {
  ImageHero({
    this.url,
  });

  @HiveField(0)
  String? url;

  factory ImageHero.fromJson(Map<String, dynamic> json) => ImageHero(
        url: json["url"],
      );
}
