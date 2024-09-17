import 'package:flutter/material.dart';
import 'package:islami/ahadeth.dart';
import 'package:islami/home.dart';
import 'package:islami/radio.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});
  static const String routeName = 'sebha';

  @override
  _SebhaState createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int _counter = 0; // Counter to keep track of the tasbeeh count
  double _rotationAngle = 0.0; // Rotation angle for the image

  // List of tasbeeh phrases
  final List<String> tasbeehPhrases = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate the current tasbeeh phrase based on the counter
    String currentPhrase = tasbeehPhrases[(_counter ~/ 30) % tasbeehPhrases.length];

    // Calculate the current count for the display
    int displayCount = (_counter % 30) + 1;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            // Rotate the image based on vertical scroll
            _rotationAngle += details.primaryDelta! / 1000;
            // Update counter based on scroll
            _counter = (_rotationAngle * 1000).round() % 120; // Limit the counter
          });
        },
        onTap: () {
          setState(() {
            // Increment counter on tap
            _counter++;
            if (_counter % 30 == 0) {
              _rotationAngle += 1; // Optional: increment rotation angle on each 30th count
            }
          });
        },
        child: Stack(
          children: [
            // Background image
            Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              children: [
                // Combined top image and sebha image
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 80, left: 170),
                      child: Image.asset(
                        'assets/images/TopOfSebhaScreen.png',
                      ),
                    ),
                    Expanded(
                      child: Transform.rotate(
                        angle: _rotationAngle,
                        child: Image.asset(
                          'assets/images/SebhaScreen.png',
                          height: 550,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // "عدد التسبيحات" text
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'عدد التسبيحات',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontFamily: 'ELMessiri',
                          ),
                        ),
                      ),
                      // Tasbeeh phrases and counter
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Column(
                          children: [
                            // Container for the counter
                            Container(
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Color(0xffB7935F),
                                  borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.all(16.0),

                              child: Center(
                                child: Text(
                                  '$displayCount',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontFamily: 'ELMessiri',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0), // Space between the two containers
                            // Container for the tasbeeh phrase
                            Container(
                              width: 500,
                              decoration: BoxDecoration(
                                  color: Color(0xffB7935F),
                                borderRadius: BorderRadius.circular(25)
                              ),
                              padding: EdgeInsets.all(16.0),

                              child: Center(
                                child: Text(
                                  currentPhrase,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'ELMessiri',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
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
                Navigator.pushNamed(context, RadioScreen.routeName);
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
