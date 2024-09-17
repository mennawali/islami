import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ahadeth.dart';
import 'package:islami/home.dart';
import 'package:islami/radio.dart';
import 'package:islami/sebha.dart';

class SuraDetailScreen extends StatelessWidget {
  final String suraName;
  final int suraIndex;

  const SuraDetailScreen({
    Key? key,
    required this.suraName,
    required this.suraIndex,
  }) : super(key: key);

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
          // Content stack
          Column(
            children: [
              // Title section
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'اسلامي',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'ELMessiri',
                    ),
                  ),
                ),
              ),
             // Space for the title image

               // Space for the list view
              Expanded(
                child: FutureBuilder(
                  future: loadSuraContent(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Error loading sura'),
                            SizedBox(height: 10),
                            Text('Error: ${snapshot.error}'),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Text(
                            snapshot.data ?? 'No content',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
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

  Future<String> loadSuraContent() async {
    try {
      final fileName = '${suraIndex + 1}.txt'; // Ensure this matches your file names
      return await rootBundle.loadString('assets/files/$fileName');
    } catch (e) {
      print('Error loading file: $e'); // Log the error for debugging
      throw e;
    }
  }
}
