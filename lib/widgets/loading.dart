import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  final bool isLoading;

  Loading({required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            color: Colors.black54,
            child: Center(
              child: Container(
                  width: 180,
                  height: 180,
                  child: Lottie.asset("assets/lottie/superhero.json",
                      repeat: true)),
            ),
          )
        : SizedBox();
  }
}
