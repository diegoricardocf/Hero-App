import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hero_app/helper/app_colors.dart';
import 'package:hero_app/helper/app_style.dart';
import 'package:hero_app/models/hero_powers.dart';
import 'package:hero_app/models/super_hero.dart';

class HeroDetails extends StatelessWidget {
  static const routeName = '/hero_details';

  @override
  Widget build(BuildContext context) {
    SuperHero _superHero = ModalRoute.of(context)?.settings.arguments as SuperHero;
    return Scaffold(
        backgroundColor: AppColors.mainBackground,
        appBar: AppBar(title: Text(_superHero.name ?? "", style: AppStyle.appBarTitle())),
        body: Container(
            margin: EdgeInsets.all(16),
            width: double.infinity,
            child: ListView(children: [
              _detailsHeader(_superHero),
              SizedBox(height: 20),
              Row(
                children: [
                  powerCard(HeroPowers(
                      description: "Inteligência",
                      score: _superHero.powerstats?.intelligence ?? "0",
                      image: "assets/images/idea.png")),
                  SizedBox(width: 16),
                  powerCard(HeroPowers(
                      description: "Força",
                      score: _superHero.powerstats?.power ?? "0",
                      image: "assets/images/strength.png")),
                  SizedBox(width: 16),
                  powerCard(HeroPowers(
                      description: "Combate",
                      score: _superHero.powerstats?.combat ?? "0",
                      image: "assets/images/boxing.png")),
                ],
              ),
              Row(
                children: [
                  powerCard(HeroPowers(
                      description: "Velocidade",
                      score: _superHero.powerstats?.speed ?? "0",
                      image: "assets/images/runner.png")),
                  SizedBox(width: 16),
                  powerCard(HeroPowers(
                      description: "Defesa",
                      score: _superHero.powerstats?.durability ?? "0",
                      image: "assets/images/shield.png")),
                  SizedBox(width: 16),
                  powerCard(HeroPowers(
                      description: "Poder",
                      score: _superHero.powerstats?.power ?? "0",
                      image: "assets/images/thunder.png")),
                ],
              )
            ])));
  }

  Expanded powerCard(HeroPowers power) {
    return Expanded(
        child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        height: 130,
        child: Column(
          children: [
            SizedBox(height: 16),
            Image.asset(power.image, width: 45, height: 45),
            SizedBox(height: 14),
            Text(power.description, style: AppStyle.powerTitle()),
            SizedBox(height: 4),
            Text((power.score), style: AppStyle.powerContent()),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.only(bottom: 10, top: 10),
    ));
  }

  Row _detailsHeader(SuperHero _superHero) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Hero(
          tag: "SUPERHERO" + (_superHero.id ?? ""),
          child: CachedNetworkImage(
              imageUrl: _superHero.image?.url ?? "",
              width: 150,
              height: 200,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => Icon(Icons.error))),
      SizedBox(width: 16),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 8),
        Text(_superHero.biography?.fullName?.toUpperCase() ?? "",
            style: AppStyle.subtitle()),
        SizedBox(height: 8),
        Text(_superHero.biography?.placeOfBirth?.toUpperCase() ?? "",
            style: AppStyle.subtitle()),
        SizedBox(height: 8),
        Text(_superHero.appearance?.gender?.toUpperCase() ?? "",
            style: AppStyle.subtitle()),
        SizedBox(height: 8),
        Text(_superHero.appearance?.race?.toUpperCase() ?? "",
            style: AppStyle.subtitle()),
        SizedBox(height: 8),
        Text(_superHero.biography?.publisher?.toUpperCase() ?? "",
            style: AppStyle.subtitle()),
        SizedBox(height: 8),
        Text(_superHero.biography?.alignment?.toUpperCase() ?? "",
            style: AppStyle.subtitle()),
      ]))
    ]);
  }
}
