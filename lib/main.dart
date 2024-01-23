import 'package:flutter/material.dart';
import 'package:student_app/screens/splash_screen/splash_screen.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Students Data',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black
        ),
        colorScheme: const ColorScheme.dark(
          
          background: Colors.black,
          secondary: Color.fromARGB(255, 255, 255, 255)
        ),
        fontFamily: 'poppins',
      ),
      home: const SplashScreen(),
    );
  }
}