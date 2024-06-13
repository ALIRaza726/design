import 'dart:async';

import 'package:meditate/screen/welcome_screen.dart';
import 'package:meditate/screen/splash_screen4.dart';
import 'package:flutter/material.dart';
import 'package:meditate/screen/app_bar.dart';

class SplashScreen3 extends StatefulWidget {
  static const routeName = '/splash_screen3';
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen3>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  @override
  void initState() {
    super.initState();
    // splashNavigator();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation =
        CurvedAnimation(parent: _controller!, curve: Curves.linearToEaseOut);

    _controller!
        .forward()
        .then((value) => Timer(const Duration(seconds: 0), () {
              Navigator.pushReplacementNamed(context, SplashScreen4.routeName);
            }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  // splashNavigator() async {
  //   await Future.delayed(const Duration(seconds: 3), () {});
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => AppBarScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 73, 247, 192),
      body: FadeTransition(
        opacity: _animation!,
        child: Center(
            child: Container(
          height: 90,
          width: 90,
          child: const Image(
            image: AssetImage("assets/images/profile.png"),
            fit: BoxFit.cover,
          ),
        )),
      ),
    );
  }
}
