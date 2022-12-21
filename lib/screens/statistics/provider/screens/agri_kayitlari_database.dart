import 'package:bas_agrisi_takip_sistemi/constants/constant.dart';
import 'package:bas_agrisi_takip_sistemi/constants/page_padding.dart';
import 'package:bas_agrisi_takip_sistemi/sqflite/model/bas_agri_model.dart';
import 'package:flutter/material.dart';

import '../../../../constants/default_button.dart';
import '../../../../sqflite/utils/db_helper.dart';

class AgriKayitlariDatabase extends StatefulWidget {
  const AgriKayitlariDatabase({Key? key}) : super(key: key);

  @override
  State<AgriKayitlariDatabase> createState() => _AgriKayitlariDatabaseState();
}

class _AgriKayitlariDatabaseState extends State<AgriKayitlariDatabase> {
  List<BasAgri> agriKayit = [];
  @override
  void initState() {
    super.initState();
    _queryAll();
  }

  String tarihDondor(String tarih) {
    String temp = tarih.substring(0, 16);
    return temp;
  }

  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ağrı Kayıtları"),
      ),
      body: Padding(
        padding: const PagePadding.allNormal(),
        child: ListView.builder(
          itemCount: agriKayit.length + 1,
          itemBuilder: ((context, index) {
            if (index == agriKayit.length) {
              return DefaultButton(
                text: "Yenile",
                press: () {
                  setState(() {
                    _queryAll();
                  });
                },
              );
            }
            return SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kMyPrimaryTextColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kMyPrimaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  "$index",
                                  style: const TextStyle(
                                    color: kMyPrimaryTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 8,
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      "Tarih",
                                    ),
                                    Text(
                                      "Ağrı Şiddeti",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      tarihDondor(
                                          agriKayit[index].date.toString()),
                                    ),
                                    Text(
                                      agriKayit[index].siddet.toString(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    agriKayit.clear();
    allRows?.forEach((element) => agriKayit.add(BasAgri.fromMap(element)));
    //_showMessageInScaffold("Query done.");
    setState(() {});
  }
}
