import 'dart:async';
import 'package:meditate/screen/splash_screen3.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
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

    _animation = CurvedAnimation(parent: _controller!, curve: accelerateEasing);

    _controller!
        .forward()
        .then((value) => Timer(const Duration(seconds: 0), () {
              Navigator.pushReplacementNamed(context, SplashScreen3.routeName);
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
      backgroundColor: Color.fromARGB(255, 73, 212, 247),
      body: FadeTransition(
        opacity: _animation!,
        child: Center(
            child: Container(
                height: 90,
                width: 120,
                child: const Text(
                  'Hello',
                  style: TextStyle(
                      fontSize: 40, color: Color.fromARGB(255, 224, 24, 24)),
                ))),
      ),
    );
  }
}
