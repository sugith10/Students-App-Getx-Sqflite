import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
              Color.fromARGB(255, 170, 198, 237),
            Color(0xFFE6E6E6), 
          
          ],
        ),
      ),
      child: Center(child: Lottie.asset('asset/json/Animation - 1705926987002.json')),
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
      style: TextStyle(fontSize: 24,
      fontWeight: FontWeight.w500,
      fontFamily: 'poppins',
      color: Color.fromARGB(255, 64, 64, 64)
      ),
    );
  }
}
