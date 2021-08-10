import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hero_app/helper/app_colors.dart';
import 'package:hero_app/helper/app_style.dart';
import 'package:hero_app/helper/hive_boxes.dart';
import 'package:hero_app/models/super_hero.dart';
import 'package:hero_app/screens/hero_details_screen.dart';
import 'package:hero_app/stores/search_hero_store.dart';
import 'package:hero_app/widgets/loading.dart';
import 'package:hero_app/widgets/no_content_view.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search_screen';
  final SearchHeroStore searchHeroStore = SearchHeroStore();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void dispose() {
    HiveBoxes.getSuperHeroesBox().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.searchHeroStore.loadHistoricHeros();
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 36),
            child: CustomScrollView(slivers: [
              _buildSearchHeader(context),
              Observer(builder: (_) =>
                  SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Container(
                              child: _heroCard(
                                  widget.searchHeroStore.heros[index],
                                  context));
                        },
                        childCount: widget.searchHeroStore.heros.length,
                      )))
            ]),
          ),
          Observer(builder: (_) => Loading(isLoading: widget.searchHeroStore.isLoading))
        ],
      ),
    );
  }

  GestureDetector _heroCard(SuperHero hero, BuildContext ctx) {
    return GestureDetector(
        onTap: () {
          widget.searchHeroStore.saveHeroInHistoric(hero);
          Navigator.of(ctx).pushNamed(HeroDetails.routeName, arguments: hero);
        },
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: "SUPERHERO" + (hero.id ?? ""),
                  child: CachedNetworkImage(
                    imageUrl: hero.image?.url ?? "",
                    width: 100,
                    height: 125,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )),
              SizedBox(width: 16),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(hero.name ?? "", style: AppStyle.cardTitle()),
                  SizedBox(height: 10),
                  Text(hero.biography?.placeOfBirth ?? "",
                      style: AppStyle.cardContent()),
                  SizedBox(height: 2),
                  Text(hero.biography?.publisher ?? "",
                      style: AppStyle.cardContent()),
                ],
              ))
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.only(bottom: 10, top: 10),
        ));
  }

  SliverToBoxAdapter _buildSearchHeader(BuildContext ctx) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(
            "Hero App",
            style: AppStyle.title(),
          ),
          SizedBox(height: 5),
          Text(
            "Pesquise seu herói favorito e conheça mais informações sobre ele.",
            style: AppStyle.subtitle(),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: TextField(
                      onChanged: (value) {
                        if (value.isEmpty) {
                          widget.searchHeroStore.loadHistoricHeros();
                        }
                      },
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          widget.searchHeroStore.searchHeroByName(value, ctx);
                        }
                      },
                      textInputAction: TextInputAction.search,
                      style: AppStyle.textField(),
                      decoration: AppStyle.textFieldInputDecoration("Nome do herói"))),
              SizedBox(width: 10),
              IconButton(
                  icon: Image.asset('assets/images/random.png'),
                  iconSize: 25,
                  onPressed: () => widget.searchHeroStore.searchHeroById(ctx))
            ],
          ),
          SizedBox(height: 10),
          Observer(
              builder: (_) => widget.searchHeroStore.showHistoric
                  ? Text("Heróis pesquisados", style: AppStyle.subtitle())
                  : SizedBox()),
          Observer(
              builder: (_) => widget.searchHeroStore.showEmptyState
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: NoContentView(
                          title: "Herói não encontrado",
                          subtitle:
                              "Não encontramos nenhum resultado para sua busca"))
                  : SizedBox()),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
