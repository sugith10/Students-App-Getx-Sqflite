import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_app/screens/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2C3E50), // Midnight blue
            Color(0xFF34495E), // Dark slate gray
          ],
        ),
      ),
      child: Center(
          child: Lottie.asset('asset/json/Animation - 1705926987002.json')),
    ));
  }
}

class QuotesWidget extends StatelessWidget {
  final String text;
  const QuotesWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: 'poppins',
          color: Color.fromARGB(255, 64, 64, 64)),
    );
  }
}
