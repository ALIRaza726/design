import 'dart:async';
import 'package:meditate/screen/splash_screen2.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen4 extends StatefulWidget {
  static const routeName = '/splash_screen4';
  const SplashScreen4({super.key});

  @override
  State<SplashScreen4> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen4> {
  VideoPlayerController? _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/images/welcome.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller!.play();
        _controller!.setLooping(false);
        SplashTimer();
      });
  }

  void SplashTimer() {
    const splashDuration = Duration(seconds: 10);
    _timer = Timer(splashDuration, navigatetoappbar);
  }

  void navigatetoappbar() {
    if (mounted) {
      Navigator.pushReplacementNamed(context, SplashScreen2.routeName);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDC109E),
      body: Center(
          child: _controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                )
              : Container()),
    );
  }
}
