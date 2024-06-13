import 'package:meditate/screen/app_bar.dart';
import 'package:meditate/screen/login_screen.dart';

import 'package:meditate/screen/signup.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/WelcomeScreen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 73, 247, 192),
      body: Column(
        children: [
          const SizedBox(
            height: 250,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/background1.jpg"),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: 40,
                ),
              ),
              const Text(
                "Hello",
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 87, 114, 106),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Welcome to My Practice App",
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 87, 114, 106),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor: const MaterialStatePropertyAll(
                      Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor: const MaterialStatePropertyAll(
                      Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signup()));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Sign In Using",
                style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 87, 114, 106),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/facebook.png"),
                            ),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomeScreen()));
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/google-plus.png"),
                            ),
                            color: Color.fromARGB(255, 251, 252, 253),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomeScreen()));
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/linkedin.png"),
                            ),
                            color: Color.fromARGB(255, 116, 117, 118),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
