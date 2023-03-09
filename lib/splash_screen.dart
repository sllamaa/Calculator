import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'homescreen.dart';

// ignore: camel_case_types
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

// ignore: camel_case_types
class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
          'https://cdn-icons-png.flaticon.com/512/2344/2344132.png'),
      // ignore: prefer_const_constructors
      title: Text(
        "Calculator",
        // ignore: prefer_const_constructors
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.purple.shade200,
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: Calculator(),
      durationInSeconds: 2,
    );
  }
}
