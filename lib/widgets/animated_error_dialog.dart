import 'package:flutter/material.dart';
import 'package:hero_app/helper/app_colors.dart';
import 'package:lottie/lottie.dart';

class AnimatedErrorDialog extends StatelessWidget {
  final String description;
  final BuildContext ctx;

  AnimatedErrorDialog({required this.description, required this.ctx});

  static show({required BuildContext ctx, required String description}) {
    showDialog(
        context: ctx,
        builder: (BuildContext context) => AnimatedErrorDialog(
              description: description,
              ctx: ctx,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        padding: EdgeInsets.only(
          top: 71,
          bottom: 4,
          left: 16,
          right: 16,
        ),
        margin: EdgeInsets.only(top: 55),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                description,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(height: 36.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.warning),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      Positioned(
          left: 16,
          right: 16,
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 55,
              child: Center(
                  child: Lottie.asset(
                "assets/lottie/warning.json",
                height: double.infinity,
                width: double.infinity,
                repeat: false,
              ))))
    ]);
  }
}
