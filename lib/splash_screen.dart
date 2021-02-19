import 'SetupPage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'main.dart';
import 'homepage.dart';
import 'globalValues.dart' as values;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreen createState() => new _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      navigateAfterSeconds: values.is_intial_setup ? Home() : SetupPage(),
      image: Image(
        image: AssetImage("lib/assets/logo.gif"),
      ),
      backgroundColor: Colors.white,
      useLoader: true,
      loaderColor: Colors.black,
      photoSize: MediaQuery.of(context).size.width / 2 - 50,
    );
  }
}
