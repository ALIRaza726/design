import 'package:flutter/material.dart';

class ClipPathScreen extends StatefulWidget {
  const ClipPathScreen({super.key});

  @override
  State<ClipPathScreen> createState() => _ClipPathScreenState();
}

class _ClipPathScreenState extends State<ClipPathScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClipPath'), centerTitle: true),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(color: Colors.orange),
            ),
          ),
          const SizedBox(height: 20),
          ClipPath(
            clipper: MyClipper2(),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.orange),
              child: const Center(
                child: Text(
                  '*',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width, size.height, 300, 300);

    return path;
  }
}

class MyClipper2 extends CustomClipper<Path> {
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, size.height / 4);
    path.lineTo(0, size.height);

    path.quadraticBezierTo(
        size.width - 100, size.height - 50, size.width, size.height - 50);

    return path;
  }
}
