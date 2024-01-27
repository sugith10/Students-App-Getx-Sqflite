import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:student_app/view/screen/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
     Get.offNamed('/home');
    });
    return Scaffold(
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: Lottie.asset('asset/json/Animation - 1705926987002.json'),
            )));
  }
}


