
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:hero_app/helper/hive_boxes.dart';
import 'package:hero_app/models/super_hero.dart';
import 'package:hero_app/repository/heros_repository.dart';
import 'package:hero_app/screens/hero_details_screen.dart';
import 'package:hero_app/widgets/animated_error_dialog.dart';
import 'package:mobx/mobx.dart';

part 'search_hero_store.g.dart';

class SearchHeroStore = _SearchHeroStoreBase with _$SearchHeroStore;

abstract class _SearchHeroStoreBase with Store {

  @observable
  var heros = ObservableList<SuperHero>();

  @observable
  var isLoading = false;

  @observable
  var showHistoricList = true;

  @observable
  var showHistoric = false;

  @computed
  int get totalItems => heros.length;

  @observable
  var showEmptyState = false;


  HerosRepository herosRepository = HerosRepository();

  @action
  searchHeroByName(String heroName, BuildContext ctx) async {
    isLoading = true;
    showHistoric = false;
    showEmptyState = false;
    heros.clear();
    final response = await herosRepository.searchHeroByName(heroName);
    if(response.error){
      AnimatedErrorDialog.show(ctx: ctx, description:response.errorMessage ?? "");
    }else{
      for (var hero in response.successData ?? []) {
        heros.add(hero);
      }
      if(heros.isEmpty){
        showEmptyState = true;
      }
    }
    isLoading = false;
  }

  @action
  loadHistoricHeros(){
    heros.clear();
    final historicHeros =  HiveBoxes.getSuperHeroesBox().values.toList().reversed.cast<SuperHero>();
    for (var historicItem in historicHeros) {
      heros.add(historicItem);
    }
    if(heros.isNotEmpty){
      showEmptyState = false;
      showHistoric = true;
    }
  }

  saveHeroInHistoric(SuperHero hero){
    final box = HiveBoxes.getSuperHeroesBox();
    box.put(hero.id, hero);
  }

  @action
  searchHeroById(BuildContext ctx) async {
    isLoading = true;
    final response = await herosRepository.searchHeroById(Random().nextInt(720));
    isLoading = false;
    if(response.error){
      AnimatedErrorDialog.show(ctx: ctx, description:response.errorMessage ?? "");
    }else{
      Navigator.of(ctx).pushNamed(HeroDetails.routeName,arguments: response.successData);
    }
  }

}