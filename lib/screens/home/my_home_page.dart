import 'package:bas_agrisi_takip_sistemi/screens/statistics/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/constant.dart';
import '../agri_kaydi/agri_kaydi_ekle.dart';
import '../headache/headache_page.dart';
import '../profile/profile_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static String routeName = "/myHomePage";
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectinIndex = 0;
  var now = DateTime.now();

  /// Sabitler
  final double _animateContainerWitdth = 80;
  final String _userProfileUrl = "assets/icons/home_userprofile.svg";
  final String _homeProfileUrl = "assets/icons/home_home.svg";
  final String _homeStatisicseUrl = "assets/icons/home_statistics.svg";
  final double _bottomBarRadius = 40;
  final double _bottomBarHeight = 60;
  final double _svgWitdh = 28;
  final int _duration = 600;
  final double _animatedContainerRadius = 25;

  @override
  Widget build(BuildContext context) {
    PageController myPage = PageController(initialPage: _selectinIndex);

    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade600,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 70,
        width: 70,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AgriKaydiEkle.routeName);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 42,
                width: 42,
                child: Text(
                  "+",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
                // child: SvgPicture.asset(
                //   "assets/icons/home_health_add.svg",
                // ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: myPage,
        children: const [
          ///
          /// Bas Ağrıları sayfası
          HeadAchePage(),

          ///
          /// İstatislik Sayfası
          StatisickPage(),

          ///
          /// Profile Sayfası
          ProfileScreen(),
        ],
      ),

      ///
      /// bottom app bar
      bottomNavigationBar: homeBottomBar(myPage),

      ///
      ///
      /// Hamburger Menü Başlangıcı
      ///
      drawer: Drawer(
        backgroundColor: kMyBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: kMyPrimaryTextColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Text('$now'),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: kMyPrimaryTextColor,
              ),
              child: ListTile(
                leading: SvgPicture.asset(
                  "assets/icons/home_userprofile.svg",
                  width: 24,
                  height: 24,
                ),
                title: const Text('Kullanici Ayarlari'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: kMyPrimaryTextColor,
              ),
              child: ListTile(
                title: const Text('Fiyatlandirma'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: kMyPrimaryTextColor,
              ),
              child: ListTile(
                title: const Text('Uygulama Gelistiricileri'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: kMyPrimaryTextColor,
              ),
              child: ListTile(
                title: const Text('Ucretlendirme'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding homeBottomBar(PageController myPage) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_bottomBarRadius),
          color: kMyPrimaryTextColor,
        ),
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: _bottomBarHeight,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: _duration),
                  width: _animateContainerWitdth,
                  decoration: BoxDecoration(
                    color: _selectinIndex == 0 ? kMyBackgroundColor : null,
                    borderRadius: BorderRadius.all(
                      Radius.circular(_animatedContainerRadius),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _selectinIndex = 0;
                        myPage.jumpToPage(_selectinIndex);
                      });
                    },
                    // flutter_charts: ^0.5.0
                    icon: SvgPicture.asset(
                      width: _svgWitdh,
                      _homeProfileUrl,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: _duration),
                  width: _animateContainerWitdth,
                  decoration: BoxDecoration(
                    color: _selectinIndex == 1 ? kMyBackgroundColor : null,
                    borderRadius: BorderRadius.all(
                      Radius.circular(_animatedContainerRadius),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _selectinIndex = 1;
                        myPage.jumpToPage(_selectinIndex);
                      });
                    },
                    icon: SvgPicture.asset(
                      _homeStatisicseUrl,
                      width: _svgWitdh,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: _duration),
                  width: _animateContainerWitdth,
                  decoration: BoxDecoration(
                    color: _selectinIndex == 2 ? kMyBackgroundColor : null,
                    borderRadius: BorderRadius.all(
                      Radius.circular(_animatedContainerRadius),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _selectinIndex = 2;
                        myPage.jumpToPage(_selectinIndex);
                      });
                    },
                    icon: SvgPicture.asset(
                      _userProfileUrl,
                      width: _svgWitdh,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
