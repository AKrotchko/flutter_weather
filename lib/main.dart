import 'package:flutter/material.dart';
import 'package:flutter_weather/ui/home_screen.dart';
import 'package:flutter_weather/ui/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen()
//      home: HomeScreen()
    );
  }
}
