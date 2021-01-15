import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'main.dart';
import 'homepage.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreen createState() => new _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Home(),
      image: Image(
        image: AssetImage("lib/assets/logo.gif"),
      ),
      backgroundColor: Colors.blue,
      useLoader: true,
      loaderColor: Colors.black,
      photoSize: MediaQuery.of(context).size.width / 2 - 50,
    );
  }
}
