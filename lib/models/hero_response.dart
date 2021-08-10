import 'dart:convert';
import 'package:hero_app/models/super_hero.dart';

HeroResponse heroResponseFromJson(String str) =>
    HeroResponse.fromJson(json.decode(str));

class HeroResponse {
  HeroResponse({this.response, this.resultsFor, this.results, this.error});

  String? response;
  String? resultsFor;
  String? error;
  List<SuperHero>? results;

  factory HeroResponse.fromJson(Map<String, dynamic> json) => HeroResponse(
        response: json["response"],
        resultsFor: json["results-for"],
        error: json["error"],
        results: List<SuperHero>.from(
            (json["results"] ?? []).map((x) => SuperHero.fromJson(x))),
      );
}
