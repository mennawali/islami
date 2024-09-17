import 'package:flutter/material.dart';
import 'package:islami/ahadeth.dart';
import 'package:islami/radio.dart';
import 'package:islami/sebha.dart';
import 'sura_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  void _onItemTapped(int index) {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> suraNames = [
      "الفاتحه", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام", "الأعراف", "الأنفال", "التوبة", "يونس",
      "هود", "يوسف", "الرعد", "إبراهيم", "الحجر", "النحل", "الإسراء", "الكهف", "مريم", "طه",
      "الأنبياء", "الحج", "المؤمنون", "النّور", "الفرقان", "الشعراء", "النّمل", "القصص", "العنكبوت",
      "الرّوم", "لقمان", "السجدة", "الأحزاب", "سبأ", "فاطر", "يس", "الصافات", "ص", "الزمر",
      "غافر", "فصّلت", "الشورى", "الزخرف", "الدّخان", "الجاثية", "الأحقاف", "محمد", "الفتح",
      "الحجرات", "ق", "الذاريات", "الطور", "النجم", "القمر", "الرحمن", "الواقعة", "الحديد", "المجادلة",
      "الحشر", "الممتحنة", "الصف", "الجمعة", "المنافقون", "التغابن", "الطلاق", "التحريم", "الملك",
      "القلم", "الحاقة", "المعارج", "نوح", "الجن", "المزّمّل", "المدّثر", "القيامة", "الإنسان",
      "المرسلات", "النبأ", "النازعات", "عبس", "التكوير", "الإنفطار", "المطفّفين", "الإنشقاق",
      "البروج", "الطارق", "الأعلى", "الغاشية", "الفجر", "البلد", "الشمس", "الليل", "الضحى",
      "الشرح", "التين", "العلق", "القدر", "البينة", "الزلزلة", "العاديات", "القارعة", "التكاثر",
      "العصر", "الهمزة", "الفيل", "قريش", "الماعون", "الكوثر", "الكافرون", "النصر", "المسد",
      "الإخلاص", "الفلق", "الناس",
    ];

    List<int> versesNumber = [
      7, 286, 200, 176, 120, 165, 206, 75, 129, 109, 123, 111, 43, 52, 99, 128, 111, 110, 98, 135, 112, 78,
      118, 64, 77, 227, 93, 88, 69, 60, 34, 30, 73, 54, 45, 83, 182, 88, 75, 85, 54, 53, 89, 59, 37, 35, 38,
      29, 18, 45, 60, 49, 62, 55, 78, 96, 29, 22, 24, 13, 14, 11, 11, 18, 12, 12, 30, 52, 52, 44, 28, 28, 20,
      56, 40, 31, 50, 40, 46, 42, 29, 19, 36, 25, 22, 17, 19, 26, 30, 20, 15, 21, 11, 8, 5, 19, 5, 8, 8, 11,
      11, 8, 3, 9, 5, 4, 6, 3, 6, 3, 5, 4, 5, 6,
    ];

    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
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
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/quran_header.png',
              width: 205,
              height: 390,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 330),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Color(0xffF2F2F2),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'عدد الآيات',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        thickness: 3,
                        color: Color(0xffB7935F),
                        width: 1,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'اسم السورة',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Color(0xffB7935F),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: suraNames.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuraDetailScreen(
                                suraName: suraNames[index],
                                suraIndex: index,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    versesNumber[index].toString(),
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 5,
                              color: Color(0xffB7935F),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    suraNames[index],
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
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
