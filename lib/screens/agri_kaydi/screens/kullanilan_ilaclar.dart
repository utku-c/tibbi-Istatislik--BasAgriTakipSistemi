import 'package:flutter/material.dart';
import '../../../constants/constant.dart';
import '../../../constants/default_button.dart';
import '../model/kullanilan_ilaclar.dart';

class KullanilanIlaclar extends StatefulWidget {
  const KullanilanIlaclar({Key? key}) : super(key: key);
  static String routeName = "/bas_agrisi_ilaclar";

  @override
  State<KullanilanIlaclar> createState() => _KullanilanIlaclarState();
}

class _KullanilanIlaclarState extends State<KullanilanIlaclar> {
  final String _kaydet = "Kaydet";
  final List<KullanilanIlacModel> _soru = [
    KullanilanIlacModel(ilacAdi: "İlac 1", faydalioldu: false),
    KullanilanIlacModel(ilacAdi: "İlac 2", faydalioldu: false),
    KullanilanIlacModel(ilacAdi: "İlac 3", faydalioldu: false),
    KullanilanIlacModel(ilacAdi: "İlac 4", faydalioldu: false),
    KullanilanIlacModel(ilacAdi: "İlac 5", faydalioldu: false),
    KullanilanIlacModel(ilacAdi: "İlac 6", faydalioldu: false),
    KullanilanIlacModel(ilacAdi: "İlac 7", faydalioldu: false),
    KullanilanIlacModel(ilacAdi: "İlac 8", faydalioldu: false),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Kullanılan İlaçlar"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: _soru.length,
                  //itemCount: _soru.length,
                  itemBuilder: (context, index) {
                    return buildSingleCheckbox(_soru[index]);
                  },
                ),
              ),
              DefaultButton(
                text: _kaydet,
                press: () {
                  Navigator.pop<List<KullanilanIlacModel>>(
                    context,
                    _soru,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSingleCheckbox(KullanilanIlacModel model) => buildCheckbox(
      model: model,
      onClicked: () {
        setState(() {
          final newValue = !model.faydalioldu;
          model.faydalioldu = newValue;
        });
      });

  Widget buildCheckbox({
    required KullanilanIlacModel model,
    required VoidCallback onClicked,
  }) =>
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kMyPrimaryTextColor.withOpacity(0.5),
          ),
          // height: 80,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.ilacAdi,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Checkbox(
                    activeColor: kMyPrimaryColor,
                    value: model.faydalioldu,
                    onChanged: (value) => onClicked(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
