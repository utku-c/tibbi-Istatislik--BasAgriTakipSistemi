import 'package:bas_agrisi_takip_sistemi/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'provider/istatik_screen.dart';
import 'provider/screens/agri_kayitlari_database.dart';

class StatisickPage extends StatefulWidget {
  const StatisickPage({Key? key}) : super(key: key);
  static String routeName = "/statistick";

  @override
  State<StatisickPage> createState() => _StatisickPageState();
}

class _StatisickPageState extends State<StatisickPage> {
  final String _statisticsUrl = "assets/icons/statistic_statistics.svg";
  final String _continuesUrl = "assets/icons/statistick_devamet2.svg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("İstatikler"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 200,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const IstaticksScreen()),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kMyPrimaryTextColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  _statisticsUrl,
                                  width: 100,
                                ),
                                const Text("İstatistikler"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) =>
                                    const AgriKayitlariDatabase()),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kMyPrimaryTextColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  _continuesUrl,
                                  width: 70,
                                ),
                                const SizedBox(height: 16),
                                const Text("Bütün Kayıtlar"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
