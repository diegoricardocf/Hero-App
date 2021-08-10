import 'dart:convert';

import 'package:hero_app/models/hero_response.dart';
import 'package:hero_app/models/super_hero.dart';
import 'package:hero_app/repository/api_response.dart';
import 'package:hero_app/repository/service_manager.dart';
import 'package:http/http.dart';

class HerosRepository {

  final serviceManager = Servicemanager();

  String _searchMovieByNameUrl = "/search/{heroName}";
  String _searchMovieByIdUrl = "/{charId}";

  Future<APIResponse<List<SuperHero>>> searchHeroByName(String name) async {
    final url = Uri.encodeFull(_searchMovieByNameUrl.replaceAll("{heroName}", name));
    Response response = await serviceManager.callService(type: HttpMethodType.GET, url: url);
    final heroResponse = heroResponseFromJson((response.body));
    if (heroResponse.response == "success") {
      return APIResponse(successData: heroResponse.results, error: false);
    } else {
      if (heroResponse.error == "character with given name not found") {
        return APIResponse(successData: [], error: false);
      }
      return APIResponse(error: true, errorMessage: "Houve um problema ao buscar o herói");
    }
  }

  Future<APIResponse<SuperHero>> searchHeroById(int id) async {
    final url = Uri.encodeFull(_searchMovieByIdUrl.replaceAll("{charId}", id.toString()));
    Response response = await serviceManager.callService(type: HttpMethodType.GET, url: url);
    if (response.statusCode == 200) {
      final heroResponse = SuperHero.fromJson(json.decode(response.body));
      return APIResponse(successData: heroResponse, error: false);
    }
    return APIResponse(error: true, errorMessage: "Houve um problema ao buscar o herói");
  }
}