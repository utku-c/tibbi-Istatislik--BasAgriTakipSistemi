import 'package:bas_agrisi_takip_sistemi/constants/page_padding.dart';
import 'package:bas_agrisi_takip_sistemi/screens/headache/aliskanliklar_page.dart';
import 'package:bas_agrisi_takip_sistemi/screens/headache/bas_agrisi_sorulari_sayfasi.dart';
import 'package:bas_agrisi_takip_sistemi/screens/headache/genel_saglik_sorunlari.dart';
import 'package:bas_agrisi_takip_sistemi/screens/headache/headache_history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/constant.dart';
import 'kadin_hastalar_page.dart';

class HeadAchePage extends StatefulWidget {
  const HeadAchePage({Key? key}) : super(key: key);
  static String routeName = "/headache";

  @override
  State<HeadAchePage> createState() => _HeadAchePageState();
}

class _HeadAchePageState extends State<HeadAchePage> {
  final String _homeFavoriteAddeUrl = "assets/icons/home_add_plus.svg";
  final double _svgWitdh = 60;
  final isOkey = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMyPrimaryTextColor,
        leading: const SizedBox(),
        title: const Text("Bas Agrisi Takibi"),
        // flexibleSpace: Container(
        //   height: 10,
        //   width: double.infinity,
        //   color: Colors.amber,
        // ),
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 20),
          child: Text("data"),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const PagePadding.allNormal(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  onTap: () {
                    // ignore: avoid_print
                    print("Tiklandi");
                    Navigator.pushNamed(context, HeadAcheHistoryPage.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kMyPrimaryTextColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 5),
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            "assets/icons/agri_kaydi_bas_agrisi.svg",
                            width: _svgWitdh,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          flex: 6,
                          child: Text(
                            "Baş Ağrısı Geçmişini Doldurmak İçin Tıklayınız...",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            _homeFavoriteAddeUrl,
                            width: _svgWitdh,
                          ),
                        ),
                        const SizedBox(width: 20)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, GenelSaglikSorunlari.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kMyPrimaryTextColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 5),
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            "assets/icons/home_health.svg",
                            width: _svgWitdh,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          flex: 6,
                          child: Text(
                            "Lutfen Genel Saglik Sorunlarinizi ekleyiniz",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            _homeFavoriteAddeUrl,
                            width: _svgWitdh,
                          ),
                        ),
                        const SizedBox(width: 20)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AliskanlikPage.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kMyPrimaryTextColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 5),
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            "assets/icons/home_aliskanlik.svg",
                            width: _svgWitdh,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          flex: 6,
                          child: Text(
                            "Lütfen Alışkanlıklarınızı Ekleyiniz",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            _homeFavoriteAddeUrl,
                            width: _svgWitdh,
                          ),
                        ),
                        const SizedBox(width: 20)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, KadinhastalarPage.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kMyPrimaryTextColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 5),
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            "assets/icons/home_kadin.svg",
                            width: _svgWitdh,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          flex: 6,
                          child: Text(
                            "Kadın Hastalara \nÖzel",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            _homeFavoriteAddeUrl,
                            width: _svgWitdh,
                          ),
                        ),
                        const SizedBox(width: 20)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, BasAgrilariSoruPage.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kMyPrimaryTextColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 5),
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            "assets/icons/home_question.svg",
                            width: _svgWitdh,
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Expanded(
                          flex: 6,
                          child: Text(
                            "Baş Ağrısı \nGenel Sorular",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            _homeFavoriteAddeUrl,
                            width: _svgWitdh,
                          ),
                        ),
                        const SizedBox(width: 20)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
