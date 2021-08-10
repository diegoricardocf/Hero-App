import 'package:flutter/material.dart';
import 'package:hero_app/helper/app_style.dart';
import 'package:lottie/lottie.dart';

class NoContentView extends StatelessWidget {
  final String title;
  final String subtitle;

  NoContentView({required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: AppStyle.noContentTitle(),textAlign: TextAlign.center,),
          Container(
              width: 250,
              height: 230,
              child: Lottie.asset("assets/lottie/spaceman.json",
                  repeat: true)),
          Text(subtitle,style:  AppStyle.noContentSubTitle(),textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
