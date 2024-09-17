import 'package:flutter/material.dart';
import 'package:islami/ahadeth.dart';
import 'package:islami/home.dart';
import 'package:islami/sebha.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});
  static const String routeName = 'radio';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Centered radio image with label
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Radio image
                Image.asset(
                  'assets/images/radioScreen.png',
                  height: 200, // Adjust size as needed
                ),
                SizedBox(height: 30), // Space between image and label
                // Label under the radio image
                Text(
                  'إذاعة القرآن الكريم',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontFamily: 'ELMessiri',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Spacer(),
                Icon(Icons.keyboard_double_arrow_left_sharp,size: 40, color: Color(0xffB7935F)),
                Spacer(),
                Icon(Icons.play_arrow_sharp,size: 40, color: Color(0xffB7935F)),
                Spacer(),
                Icon(Icons.keyboard_double_arrow_right,size: 40, color: Color(0xffB7935F)),
                    Spacer(),
                    ],
                ),
              ],
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
