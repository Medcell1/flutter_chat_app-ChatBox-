import 'dart:async';

import 'package:chat_box/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(Duration(seconds: 3), navigate);
  }

  void navigate() {
    changeScreen();
  }

  changeScreen() {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => SignInScreen()), (
        route) => false);
  }
  @override
  void initState() {
    startTimer();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(
                'assets/c.png',
              ),
            ),
          )
        ],
      ),
    );
  }
}
