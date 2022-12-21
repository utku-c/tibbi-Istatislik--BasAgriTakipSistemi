import 'package:flutter/material.dart';
import '../screens/agri_kaydi/agri_kaydi_ekle.dart';
import '../screens/agri_kaydi/screens/bas_agri_siddeti.dart';
import '../screens/agri_kaydi/screens/bas_agrisi_belirtiler_sayfasi.dart';
import '../screens/agri_kaydi/screens/bas_agrisi_tetikleyiciler.dart';
import '../screens/agri_kaydi/screens/kullanilan_ilaclar.dart';
import '../screens/agri_kaydi/screens/notlar_sayfasi.dart';
import '../screens/headache/aliskanliklar_page.dart';
import '../screens/headache/bas_agrisi_sorulari_sayfasi.dart';
import '../screens/headache/genel_saglik_sorunlari.dart';
import '../screens/headache/headache_history_page.dart';
import '../screens/headache/headache_page.dart';
import '../screens/headache/kadin_hastalar_page.dart';
import '../screens/home/my_home_page.dart';
import '../screens/onboard/on_board_page.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/sign_in/sign_in_screen.dart';
import '../screens/sign_up/sign_up_screen.dart';
import '../screens/statistics/statistics_page.dart';
import '../user/user_help_center_screen.dart';
import '../user/user_notification_screen.dart';
import '../user/user_screen.dart';
import '../user/user_settings_screen.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardPage.routeName: (context) => const OnBoardPage(),
  SignInPage.routeName: (context) => const SignInPage(),
  MyHomePage.routeName: (context) => const MyHomePage(),
  HeadAchePage.routeName: (context) => const HeadAchePage(),
  HeadAcheHistoryPage.routeName: (context) => const HeadAcheHistoryPage(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  UserProfile.routeName: (context) => const UserProfile(),
  UserProfileSetting.routeName: (context) => const UserProfileSetting(),
  UserNotification.routeName: (context) => const UserNotification(),
  UserHelpCenterScreen.routeName: (context) => const UserHelpCenterScreen(),
  GenelSaglikSorunlari.routeName: (context) => const GenelSaglikSorunlari(),
  AliskanlikPage.routeName: (context) => const AliskanlikPage(),
  KadinhastalarPage.routeName: (context) => const KadinhastalarPage(),
  BasAgrilariSoruPage.routeName: (context) => const BasAgrilariSoruPage(),
  AgriKaydiEkle.routeName: (context) => const AgriKaydiEkle(),
  BasAgrisiBelirtiler.routeName: (context) => const BasAgrisiBelirtiler(),
  KullanilanIlaclar.routeName: (context) => const KullanilanIlaclar(),
  TetikleyicilerSayfasi.routeName: (context) => const TetikleyicilerSayfasi(),
  NotlarSayfasi.routeName: (context) => const NotlarSayfasi(),
  BasAgriSiddeti.routeName: (context) => const BasAgriSiddeti(),
  StatisickPage.routeName: (context) => const StatisickPage(),
  SignUpPage.routeName: (context) => const SignUpPage(),
};
