import 'package:flutter/material.dart';
import 'package:islami/ahadeth.dart';
import 'package:islami/home.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islami/radio.dart';
import 'package:islami/sebha.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Ahadeth.routeName:(context) => Ahadeth(),
        RadioScreen.routeName:(context) => RadioScreen(),
        Sebha.routeName:(context) => Sebha(),

      },
    );
  }
}