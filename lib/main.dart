import 'package:bas_agrisi_takip_sistemi/routes/rautes.dart';
import 'package:bas_agrisi_takip_sistemi/screens/onboard/on_board_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'constants/all_border_radius.dart';
import 'constants/constant.dart';
import 'screens/statistics/provider/state/statistick_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StatistickModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Tıbbi',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        //home: const AnimasyonluListe(),
        // home: const OnBoardPage(),
        //home: const StatsScreen(),
        initialRoute: OnBoardPage.routeName,
        routes: routes,
      ),
    );
  }
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kMyBackgroundColor,
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(
      color: kMyPrimaryColor,
      size: 20.0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kMyPrimaryTextColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: kMyPrimaryTextColor,
      elevation: 20,
      shape: AutomaticNotchedShape(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        StadiumBorder(),
      ),
    ),
    primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
    ),

    // ! SLİDER THEME
    sliderTheme: const SliderThemeData(
      // track color
      activeTrackColor: kMyPrimaryColor,
      inactiveTrackColor: kMyPrimaryTextColor,
      valueIndicatorColor: kMyPrimaryColor,
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      // tick in between

      activeTickMarkColor: Colors.transparent,
      inactiveTickMarkColor: Colors.black,
      thumbColor: kMyPrimaryColor,
      // overlayColor: Colors.amber,

      // data
      // trackHeight: 16,
      // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
      // overlayShape: RoundSliderOverlayShape(overlayRadius: 50),
    ),

    // ! APPBAR THEME
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: kMyBackgroundColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: const IconThemeData(
        color: kMyPrimaryColor,
        size: 22,
      ),
      titleTextStyle: GoogleFonts.fuzzyBubbles(
        color: kMyPrimaryColor,
        fontSize: kMyFontSizeHigh,
      ),
    ),
    textTheme: TextTheme(
      // bodyText1: GoogleFonts.robotoMono(color: kMyPrimaryColor, fontSize: 18),
      // bodyText2: GoogleFonts.robotoMono(color: kMyPrimaryColor, fontSize: 18),
      // bodyText1: GoogleFonts.lobster(color: kMyPrimaryColor, fontSize: 20),
      // bodyText2: GoogleFonts.lobster(color: kMyPrimaryColor, fontSize: 20),
      // bodyText1: GoogleFonts.indieFlower(color: kMyPrimaryColor, fontSize: 20),
      // bodyText2: GoogleFonts.indieFlower(color: kMyPrimaryColor, fontSize: 20),
      bodyText1: GoogleFonts.fuzzyBubbles(color: kMyPrimaryColor, fontSize: 18),
      bodyText2: GoogleFonts.fuzzyBubbles(color: kMyPrimaryColor, fontSize: 18),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: kMyPrimaryColor,
      prefixIconColor: kMyPrimaryColor,
      iconColor: kMyPrimaryColor,
      hintStyle: const TextStyle(color: kMyPrimaryTextColor),
      labelStyle: const TextStyle(color: kMyPrimaryColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
        borderSide: const BorderSide(
          width: 2,
          color: kMyPrimaryColor,
        ),
        gapPadding: 10,
      ),
      errorStyle: const TextStyle(
        color: Colors.white,
        decoration: TextDecoration.underline,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: kMyPrimaryColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: kMyPrimaryColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: kMyPrimaryTextColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
    ),
  );
}
