import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_weather/routes/fade_route.dart';
import 'package:flutter_weather/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  loadHomePage() async {
    await Future.delayed(Duration(seconds: 5));

    Navigator.push(context, FadeRoute(page: HomeScreen()));
  }

  @override
  void initState() {
    super.initState();

    loadHomePage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[700],
        body: Container(
          child: Center(
            child: Image.asset('assets/images/icon_logo.png', width: MediaQuery.of(context).size.width / 2, height: MediaQuery.of(context).size.width / 2),
          ),
        ),
      ),
    );
  }
}

//class SplashScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: () async => false,
//      child: MaterialApp(
////          theme: githubOptions.theme.data,
//          home: Scaffold(
//            body: InitialLoader(),
//          )),
//    );
//  }
//}
//
//class InitialLoader extends StatefulWidget {
//  final double radius;
//  final double dotRadius;
//
//  InitialLoader({this.radius = 100.0, this.dotRadius = 6.0});
//
//  @override
//  _InitialLoaderState createState() => _InitialLoaderState();
//}
//
//class _InitialLoaderState extends State<InitialLoader> with SingleTickerProviderStateMixin {
//
//  Animation<double> animationRotation;
//  AnimationController controller;
//
//  double radius;
//  double dotRadius;
//
//  @override
//  void initState() {
//    super.initState();
//
//    radius = widget.radius;
//    dotRadius = widget.dotRadius;
//
//    controller = AnimationController(
//        lowerBound: 0.0,
//        upperBound: 1.0,
//        duration: const Duration(milliseconds: 3000),
//        vsync: this);
//
//    animationRotation = Tween(begin: 0.0, end: 1.0).animate(
//      CurvedAnimation(
//        parent: controller,
//        curve: Interval(0.0, 1.0, curve: Curves.linear),
//      ),
//    );
//
//    controller.addStatusListener((status) {
//      if (status == AnimationStatus.completed) {}
//    });
//
//    controller.repeat();
//  }
//
//  @override
//  void dispose() {
//    controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Container(
//      color: Colors.blue,
//      child: Center(
//        child: Container(
////          color: Colors.white,
//          width: 100.0,
//          height: 100.0,
//          //color: Colors.black12,
//          child: Center(
//            child: Stack(
//              children: <Widget>[
//                Center(
//                  child: Container(
//                    height: 60,
//                    width: 60,
//                    child: Image.asset('assets/images/weather_icon.png'),
//                  ),
//                ),
//                RotationTransition(
//                  turns: animationRotation,
//                  child: Container(
//                    //color: Colors.limeAccent,
//                    child: Center(
//                      child: Stack(
//                        children: <Widget>[
//                          Dot(
//                            radius: dotRadius,
//                            color: Colors.red,
//                            image: 'assets/images/icon_thunder.png',
//                            offset: Offset(
//                              radius * cos(0.0),
//                              radius * sin(0.0),
//                            ),
//                          ),
//                          Dot(
//                            radius: dotRadius,
//                            color: Colors.orange,
//                            image: 'assets/images/icon_sun.png',
//                            offset: Offset(
//                              radius * cos(0.0 + 1 * pi / 4),
//                              radius * sin(0.0 + 1 * pi / 4),
//                            ),
//                          ),
//                          Dot(
//                            radius: dotRadius,
//                            color: Colors.yellow,
//                            image: 'assets/images/icon_snow.png',
//                            offset: Offset(
//                              radius * cos(0.0 + 2 * pi / 4),
//                              radius * sin(0.0 + 2 * pi / 4),
//                            ),
//                          ),
//                          Dot(
//                            radius: dotRadius,
//                            color: Colors.green,
//                            image: 'assets/images/icon_rain.png',
//                            offset: Offset(
//                              radius * cos(0.0 + 3 * pi / 4),
//                              radius * sin(0.0 + 3 * pi / 4),
//                            ),
//                          ),
//                          Dot(
//                            radius: dotRadius,
//                            color: Colors.blue,
//                            image: 'assets/images/icon_dust.png',
//                            offset: Offset(
//                              radius * cos(0.0 + 4 * pi / 4),
//                              radius * sin(0.0 + 4 * pi / 4),
//                            ),
//                          ),
//                          Dot(
//                            radius: dotRadius,
//                            color: Colors.indigo,
//                            image: 'assets/images/icon_cloud_sun.png',
//                            offset: Offset(
//                              radius * cos(0.0 + 5 * pi / 4),
//                              radius * sin(0.0 + 5 * pi / 4),
//                            ),
//                          ),
//                          Dot(
//                            radius: dotRadius,
//                            color: Colors.purple,
//                            image: 'assets/images/icon_cloud_little_rain.png',
//                            offset: Offset(
//                              radius * cos(0.0 + 6 * pi / 4),
//                              radius * sin(0.0 + 6 * pi / 4),
//                            ),
//                          ),
//                          Dot(
//                            radius: dotRadius,
//                            color: Colors.pink,
//                            image: 'assets/images/icon_cloud.png',
//                            offset: Offset(
//                              radius * cos(0.0 + 7 * pi / 4),
//                              radius * sin(0.0 + 7 * pi / 4),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class Dot extends StatelessWidget {
//  Dot({@required this.radius, @required this.color, @required this.offset, @required this.image});
//
//  final double radius;
//  final Color color;
//  final Offset offset;
//
//  final String image;
//
//  @override
//  Widget build(BuildContext context) {
//    return Transform.translate(
//      offset: offset,
//      child: Center(
//        child: Container(
//          width: this.radius,
//          height: this.radius,
//          decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
//        ),
//      ),
//    );
//  }
//}

/*
Image.asset(image, height: this.radius * 4, width: this.radius * 4,)
 */
