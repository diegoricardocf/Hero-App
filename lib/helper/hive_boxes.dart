import 'package:hero_app/models/super_hero.dart';
import 'package:hive/hive.dart';

class HiveBoxes{
  static Box<SuperHero> getSuperHeroesBox() => Hive.box("heros");
}