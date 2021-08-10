import 'package:flutter/material.dart';
import 'package:hero_app/helper/app_colors.dart';
import 'package:hero_app/helper/app_style.dart';
import 'package:hero_app/screens/search_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _goToSearchScreen(context);
    return Scaffold(
        backgroundColor: AppColors.mainBackground,
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  "assets/lottie/superhero.json",
                  height: 250,
                  width: 250,
                  repeat: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Hero App",
                  style: AppStyle.title(),
                ),
              ],
            ),
          ),
        ));
  }

  void _goToSearchScreen(BuildContext ctx) async {
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(ctx).popAndPushNamed(SearchScreen.routeName);
    });
  }
}
