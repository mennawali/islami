import 'package:flutter/material.dart';
import 'package:islami/ahadeth.dart';
import 'package:islami/home.dart';
import 'package:islami/radio.dart';
import 'package:islami/sebha.dart';

class HadethDetailScreen extends StatelessWidget {
  final int hadethNumber;
  final String hadethText;

  const HadethDetailScreen({
    super.key,
    required this.hadethNumber,
    required this.hadethText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الحديث رقم $hadethNumber'),
        backgroundColor: Color(0xffB7935F),
      ),
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Text(
                hadethText,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'ELMessiri',
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color(0xffB7935F),
        child: Row(
          children: [
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RadioScreen.routeName);
              },
              icon: Image.asset('assets/images/radio.png'),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Sebha.routeName);
              },
              icon: Image.asset('assets/images/sebha.png'),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Ahadeth.routeName);
              },
              icon: Image.asset('assets/images/ahadeth.png'),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              icon: Image.asset('assets/images/quran.png'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
