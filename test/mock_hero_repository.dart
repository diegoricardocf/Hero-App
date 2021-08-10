import 'package:hero_app/models/appearance.dart';
import 'package:hero_app/models/biography.dart';
import 'package:hero_app/models/image_hero.dart';
import 'package:hero_app/models/powerstats.dart';
import 'package:hero_app/models/super_hero.dart';
import 'package:hero_app/repository/api_response.dart';
import 'package:hero_app/repository/heros_repository.dart';
import 'package:mockito/mockito.dart';

class MockHeroRepository extends Mock implements HerosRepository {
  bool returnEmptyList;
  MockHeroRepository({this.returnEmptyList = false});

  @override
  Future<APIResponse<List<SuperHero>>> searchHeroByName(String name) async {
    return _getHerosMocked(returnEmptyList);
  }

  Future<APIResponse<List<SuperHero>>> _getHerosMocked(bool returnEmptyList) async{
    final response = APIResponse<List<SuperHero>>();
    if(returnEmptyList){
      response.error = false;
      response.successData = [];
      return response;
    }
    final hero =  SuperHero(
        id: "405",
        name: "Lex Luthor",
        powerstats: Powerstats(
            intelligence: "100",
            strength: "53",
            speed: "25",
            durability: "65",
            power: "68",
            combat: "70"),
        biography: Biography(
            fullName: "Lex Luthor",
            alterEgos: "No alter egos found.",
            aliases: ["-"],
            placeOfBirth: "-",
            firstAppearance: "Action Comics #23",
            publisher: "DC Comics",
            alignment: "bad"),
        appearance: Appearance(
            gender: "Male",
            race: "Human",
            height: ["6'2'", "188 cm"],
            weight: ["210 lb", "95 kg"],
            eyeColor: "Green",
            hairColor: "No Hair"),
        image: ImageHero(
            url: "https://www.superherodb.com/pictures2/portraits/10/100/727.jpg"));

    response.successData = <SuperHero>[hero];
    response.error = false;
    return response;
  }
}
