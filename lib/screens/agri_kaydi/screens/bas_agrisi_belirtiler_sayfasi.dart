import 'package:flutter/material.dart';
import '../../../constants/constant.dart';
import '../../../constants/default_button.dart';
import '../model/bas_agrisi_belirtiler.dart';

class BasAgrisiBelirtiler extends StatefulWidget {
  const BasAgrisiBelirtiler({Key? key}) : super(key: key);
  static String routeName = "/bas_agrisi_belirtiler";

  @override
  State<BasAgrisiBelirtiler> createState() => _BasAgrisiBelirtilerState();
}

class _BasAgrisiBelirtilerState extends State<BasAgrisiBelirtiler> {
  final String _kaydet = "Kaydet";

  final List<BasAgrisiBelirtiModel> _soru = [
    BasAgrisiBelirtiModel(soru: "Baş Dönmesi", isOkey: false),
    BasAgrisiBelirtiModel(soru: "Mide Bulantısı", isOkey: false),
    BasAgrisiBelirtiModel(soru: "Mide Bulantısı", isOkey: false),
    BasAgrisiBelirtiModel(soru: "Göz Kararması", isOkey: false),
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
          title: const Text(
            "Belirtileri Seç",
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 410,
                child: ListView.builder(
                  itemCount: _soru.length,
                  itemBuilder: (context, index) {
                    return buildSingleCheckbox(_soru[index]);
                  },
                ),
              ),
              const SizedBox(height: 50),
              const SizedBox(height: 50),
              DefaultButton(
                text: _kaydet,
                press: () {
                  Navigator.pop<List<BasAgrisiBelirtiModel>>(
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

  Widget buildSingleCheckbox(BasAgrisiBelirtiModel model) => buildCheckbox(
      model: model,
      onClicked: () {
        setState(() {
          final newValue = !model.isOkey;
          model.isOkey = newValue;
        });
      });

  Widget buildCheckbox({
    required BasAgrisiBelirtiModel model,
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
          height: 100,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.soru,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Checkbox(
                    activeColor: kMyPrimaryColor,
                    value: model.isOkey,
                    onChanged: (value) => onClicked(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
