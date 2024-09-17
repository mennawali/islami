import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import to use rootBundle
import 'package:islami/home.dart';
import 'package:islami/radio.dart';
import 'package:islami/hadeth_detail.dart';
import 'package:islami/sebha.dart'; // Import the detail screen

class Ahadeth extends StatefulWidget {
  const Ahadeth({super.key});
  static const String routeName = 'ahadeth';

  @override
  _AhadethState createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  String _hadiths = ''; // Initialize as an empty string

  @override
  void initState() {
    super.initState();
    _loadHadiths();
  }

  Future<void> _loadHadiths() async {
    try {
      // Load the raw data from the file
      final String data = await rootBundle.loadString('assets/files/ahadeth.txt');
      print('Raw data: $data'); // Debugging line

      setState(() {
        _hadiths = data;
      });
    } catch (e) {
      print('Error loading Hadiths: $e'); // Debugging line
    }
  }

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
          // Ahadeth screen image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/ahadethScreen.png',
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Positioned(
            top: 250, // Adjust based on the height of the image
            left: 0,
            right: 0,
            bottom: 0, // Ensure it takes up the remaining space
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Add padding around the content
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(
                      thickness: 3,
                      color: Color(0xffB7935F),
                    ),
                  ),
                  // Title text
                  Center(
                    child: Text(
                      'الاحاديث',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'ELMessiri',
                      ),
                    ),
                  ),
                  // Second Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(
                      thickness: 3,
                      color: Color(0xffB7935F),
                    ),
                  ),
                  // List of حديث numbers
                  Expanded(
                    child: ListView.builder(
                      itemCount: _hadiths.isEmpty ? 0 : _hadiths.split('#').length, // Calculate based on the number of hadiths
                      itemBuilder: (context, index) {
                        final hadithNumber = index + 1;
                        final hadithText = _hadiths.split('#')[index].trim();

                        // Debugging: Print Hadith Text
                        print('Hadith $hadithNumber: $hadithText');

                        return ListTile(
                          title: Center(
                            child: Text(
                              'الحديث رقم $hadithNumber',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontFamily: 'ELMessiri',
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HadethDetailScreen(
                                  hadethNumber: hadithNumber,
                                  hadethText: hadithText,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
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
