import 'package:flutter/material.dart';
import '../login.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash2 extends StatelessWidget {
  final spImage = 'https://picsum.photos/250?image=2';
  final spText = 'Welcome to visit';

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      title: Text(
        spText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.yellow,
        ),
      ),
      seconds: 8,
      navigateAfterSeconds: Login(),
      image: Image.network(spImage),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 150.0,
      onClick: () => print("splash screen now"),
      loaderColor: Colors.white,
    );
  }
}
