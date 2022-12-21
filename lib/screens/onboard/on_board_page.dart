import 'package:bas_agrisi_takip_sistemi/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../constants/constant.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);
  static String routeName = "/on_board_page";
  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        onSkip: () {},
        nextFlex: 0,
        skipOrBackFlex: 0,
        animationDuration: 500,
        // onChange: (value) => print("Page $value selected"),
        globalBackgroundColor: kMyBackgroundColor,
        dotsDecorator: DotsDecorator(
            activeColor: kMyPrimaryColor,
            activeSize: const Size(22, 12),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
        next: const Icon(
          Icons.arrow_forward,
          color: kMyPrimaryColor,
          size: 28,
        ),
        pages: [
          PageViewModel(
            title: "BASAGRILARI...",
            body:
                '''Basagrisi ile basvuran hastalarin  tanisinda esasi hastanin hikayesi olusturmaktadir.Hastalara yeterli zaman ayirip, yakinmalarinin dogru degerlendirilerek, tani yanlisliklari ve gereksiz tetkiklerden kacinmak mumkundur. Basagrili hasta degerlendirilirken ilk basamak, basagrisinin primer veya sekonder olup olmadiginin ayirimidir.''',
            // footer: Container(
            //   color: Colors.amber,
            //   height: 80,
            //   width: 200,
            // ),
            image: buildImage("assets/images/_onboard_health2.png"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            titleWidget: Container(
              height: 60,
              decoration: BoxDecoration(
                color: kMyPrimaryTextColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Saglik Kafada Baslar",
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ),
            body:
                "Uygulamamizda sorulara dogru yanit vererek, gerekli formlari doldurarak basagrinizla ilgili doktorlardan daha iyi bir tedavi alabilirsiniz..",
            image: buildImage("assets/images/_onboard_health.png"),
            decoration: getPageDecoration(),
          ),
        ],
        done: const Icon(
          Icons.arrow_forward,
          color: kMyPrimaryColor,
          size: 28,
        ),
        onDone: () {
          Navigator.pushNamed(context, SignInPage.routeName);
        },
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 20,
      ),
      imagePadding: EdgeInsets.only(top: 80),
      pageColor: kMyBackgroundColor,
    );
  }

  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 350,
        ),
      );
}
