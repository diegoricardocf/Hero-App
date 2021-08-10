import 'package:flutter/material.dart';
import 'package:hero_app/helper/app_colors.dart';
import 'package:hero_app/models/appearance.dart';
import 'package:hero_app/models/image_hero.dart';
import 'package:hero_app/models/powerstats.dart';
import 'package:hero_app/models/super_hero.dart';
import 'package:hero_app/screens/hero_details_screen.dart';
import 'package:hero_app/screens/search_screen.dart';
import 'package:hero_app/screens/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/biography.dart';

void main()  async{

  // Initialize Hive database and the type of objects that are going to be storage
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SuperHeroAdapter());
  Hive.registerAdapter(AppearanceAdapter());
  Hive.registerAdapter(BiographyAdapter());
  Hive.registerAdapter(ImageHeroAdapter());
  Hive.registerAdapter(PowerstatsAdapter());
  await Hive.openBox<SuperHero>("heros");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hero App',
        theme: ThemeData(
          primaryColor: AppColors.mainBackground
        ),
        routes: {
          '/': (ctx) => SplashScreen(),
          SearchScreen.routeName:(ctx) => SearchScreen(),
          HeroDetails.routeName:(ctx) => HeroDetails()
        });
  }
}
