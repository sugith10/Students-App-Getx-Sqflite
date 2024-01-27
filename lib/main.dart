import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/db_controller/student_db_controller/student_db_controller.dart';
import 'package:student_app/view/screen/add_screen/add_screen.dart';
import 'package:student_app/view/screen/home_screen/home_screen.dart';
import 'package:student_app/view/screen/splash_screen/splash_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await StudentDataCntrl().initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Students Data',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        colorScheme: const ColorScheme.dark(
            background: Colors.black,
            secondary: Color.fromARGB(255, 255, 255, 255)),
        fontFamily: 'poppins',
      ),
      initialRoute: '/',
      defaultTransition: Transition.leftToRight,
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
            transition: Transition.native,
        ),
        GetPage(
          name: '/addStudent',
          page: () => AddStudentScreen(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 400),
        ),
      ],
      home: const SplashScreen(),
    );
  }
}
