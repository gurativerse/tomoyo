import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tomoyo/client/Home.dart';
import 'package:tomoyo/client/Introduct.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      navigateFromSplash,
    );
  }

  void navigateFromSplash() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF6F6),
      body: Center(
        child: Image.asset('./asset/branding.png',
            height: 300, width: 300), // Ensure your asset path is correct
      ),
    );
  }
}
