import 'package:bas_agrisi_takip_sistemi/constants/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants/default_button.dart';
import '../../../sqflite/model/bas_agri_model.dart';
import '../../../sqflite/utils/db_helper.dart';

class IstaticksScreen extends StatefulWidget {
  const IstaticksScreen({Key? key}) : super(key: key);

  @override
  State<IstaticksScreen> createState() => _IstaticksScreenState();
}

class _IstaticksScreenState extends State<IstaticksScreen> {
  final double _width = 12;
  List<BasAgri> agriKayit = [];
  final dbHelper = DatabaseHelper.instance;
  double ocak = 0;
  double subat = 0;
  double mart = 0;
  double nisan = 0;
  double mayis = 0;
  double haziran = 0;
  double temmuz = 0;
  double agustos = 0;
  double eylul = 0;
  double ekim = 0;
  double kasim = 0;
  double aralik = 0;
  bool grafikGoster = false;
  @override
  void initState() {
    super.initState();
    _queryAll();
  }

  Future<void> sayiDuzenle() async {
    if (agriKayit.isNotEmpty) {
      for (int i = 0; i < agriKayit.length; i++) {
        switch (agriKayit[i].date!.substring(5, 7)) {
          case "1":
            ocak = ocak + 1;
            break;
          case "2":
            subat = subat + 1;
            break;
          case "3":
            mart = mart + 1;
            break;
          case "4":
            nisan = nisan + 1;
            break;
          case "5":
            mayis = mayis + 1;
            break;
          case "6":
            haziran = haziran + 1;
            break;
          case "7":
            temmuz = temmuz + 1;
            break;
          case "8":
            agustos = agustos + 1;
            break;
          case "9":
            eylul = eylul + 1;
            break;
          case "10":
            ekim = ekim + 1;
            break;
          case "11":
            kasim = kasim + 1;
            break;
          case "12":
            aralik = aralik + 1;
            break;
          default:
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grafiksel Gösterim"),
      ),
      body: grafikGoster == true
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(
                      border: const Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide(width: 1),
                    bottom: BorderSide(width: 1),
                  )),
                  groupsSpace: 20,
                  barGroups: [
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                        fromY: 0,
                        width: _width,
                        color: kMyPrimaryTextColor,
                        toY: ocak,
                      ),
                    ]),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          fromY: 0,
                          width: _width,
                          color: kMyPrimaryTextColor,
                          toY: subat,
                        ),
                      ],
                    ),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(
                        fromY: 0,
                        width: _width,
                        color: kMyPrimaryTextColor,
                        toY: mart,
                      ),
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(
                        fromY: 0,
                        width: _width,
                        color: kMyPrimaryTextColor,
                        toY: nisan,
                      ),
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(
                        fromY: 0,
                        width: _width,
                        color: kMyPrimaryTextColor,
                        toY: mayis,
                      ),
                    ]),
                    BarChartGroupData(x: 6, barRods: [
                      BarChartRodData(
                        fromY: 0,
                        width: _width,
                        color: kMyPrimaryTextColor,
                        toY: haziran,
                      ),
                    ]),
                    BarChartGroupData(x: 7, barRods: [
                      BarChartRodData(
                        fromY: 0,
                        width: _width,
                        color: kMyPrimaryTextColor,
                        toY: temmuz,
                      ),
                    ]),
                    BarChartGroupData(x: 8, barRods: [
                      BarChartRodData(
                        fromY: 0,
                        width: _width,
                        color: kMyPrimaryTextColor,
                        toY: agustos,
                      ),
                    ]),
                    BarChartGroupData(x: 9, barRods: [
                      BarChartRodData(
                        fromY: 0,
                        width: _width,
                        color: kMyPrimaryTextColor,
                        toY: eylul,
                      ),
                    ]),
                    BarChartGroupData(x: 10, barRods: [
                      BarChartRodData(
                        fromY: 0,
                        width: _width,
                        color: kMyPrimaryTextColor,
                        toY: ekim,
                      ),
                    ]),
                    BarChartGroupData(x: 11, barRods: [
                      BarChartRodData(
                        fromY: 0,
                        width: _width,
                        color: kMyPrimaryTextColor,
                        toY: kasim,
                      ),
                    ]),
                    BarChartGroupData(x: 12, barRods: [
                      BarChartRodData(
                        fromY: 0,
                        width: _width,
                        color: kMyPrimaryTextColor,
                        toY: aralik,
                      ),
                    ]),
                  ],
                ),
              ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: DefaultButton(
                  text: "Sonuçları Göster",
                  press: () {
                    setState(() {
                      sayiDuzenle();
                    });
                    grafikGoster = true;
                  },
                ),
              ),
            ),
    );
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    agriKayit.clear();
    allRows?.forEach((element) => agriKayit.add(BasAgri.fromMap(element)));
    setState(() {});
  }
}
