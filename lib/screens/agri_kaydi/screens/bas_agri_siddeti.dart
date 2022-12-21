// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../../constants/constant.dart';
import '../../../constants/default_button.dart';
import '../model/bas_agrisi_model.dart';

class BasAgriSiddeti extends StatefulWidget {
  const BasAgriSiddeti({Key? key}) : super(key: key);
  static String routeName = "/bas_agrisi_siddeti";

  @override
  State<BasAgriSiddeti> createState() => _BasAgriSiddetiState();
}

class _BasAgriSiddetiState extends State<BasAgriSiddeti> {
  final String _kaydet = "Kaydet";
  final String _anasayfaText =
      "Baş Ağrınızı 0 - 10 arasında bir değerlendirme Yapın";
  double currentValue = 2;
  BasAgriDereceModel model = BasAgriDereceModel(
    value: 0,
    isOkey: false,
  );
  Future<void> verileriGuncelle() async {
    model.isOkey = true;
    model.value = currentValue.round();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Baş Ağrı Şiddetiniz",
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                _anasayfaText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kMyPrimaryTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                //inactiveColor: kMyPrimaryTextColor,
                autofocus: true,
                divisions: 10,
                label: "${currentValue.round()}",
                value: currentValue,
                //activeColor: kMyPrimaryColor,
                min: 0,
                max: 10,
                onChanged: (value) {
                  setState(() {
                    currentValue = value;
                  });
                },
                onChangeEnd: (value) async {
                  //await Future.delayed(const Duration(seconds: 2));
                  model.isOkey = true;
                  model.value = currentValue.round();
                  //verileriGuncelle();
                },
              ),
              const SizedBox(height: 50),
              const SizedBox(height: 50),
              const SizedBox(height: 100),
              DefaultButton(
                text: _kaydet,
                press: () {
                  Navigator.pop<BasAgriDereceModel>(
                    context,
                    model,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
