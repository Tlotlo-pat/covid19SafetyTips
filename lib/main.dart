import 'package:covid19tips/pages/home_screen.dart';
import 'package:covid19tips/pages/intro_screen.dart';
import 'package:covid19tips/pages/splash_screen.dart';
import 'package:flutter/material.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/intro": (BuildContext context) => IntroScreen(),
};

void main() => runApp(new MaterialApp(
    theme: ThemeData(primaryColor: Colors.blueGrey, accentColor: Colors.white),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));
