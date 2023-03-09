import 'package:flutter/material.dart';
import 'package:flutter_application_1/splash_screen.dart';
import 'package:flutter_application_1/themes.dart';
import 'homescreen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightMode,
      darkTheme: MyThemes.darkMode,
      initialRoute: '/spalsh_screen',
      routes: {
        '/spalsh_screen': (context) => const Splash_Screen(),
        '/homescreen': (context) => Calculator(),
      },
    ));
