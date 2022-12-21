import 'package:bas_agrisi_takip_sistemi/constants/constant.dart';
import 'package:flutter/material.dart';
import '../../../constants/default_button.dart';
import '../model/bas_agrisi_not_model.dart';

class NotlarSayfasi extends StatefulWidget {
  const NotlarSayfasi({Key? key}) : super(key: key);
  static String routeName = "/bas_agrisi_notlar";

  @override
  State<NotlarSayfasi> createState() => _NotlarSayfasiState();
}

class _NotlarSayfasiState extends State<NotlarSayfasi> {
  BasAgrisiNotModel model = BasAgrisiNotModel(not: "");
  final soru1 = TextEditingController();

  final String _kaydet = "Kaydet";
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text(
            "Ağrınızla ilgili açıklama yapınız",
            style: TextStyle(fontSize: 22),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onTap: () {
                      setState(() {
                        isActive = true;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        model.not = value;
                      });
                    },
                    maxLines: 10,
                    textInputAction: TextInputAction.done,
                    controller: soru1,
                    decoration: InputDecoration(
                      labelText: "Doldurulması Zorunlu",
                      hintText: "Notunuzu Yazınız",
                      labelStyle: TextStyle(
                        color: isActive == false
                            ? kMyPrimaryColor
                            : kMyPrimaryTextColor,
                      ),
                      helperText: soru1.value.text.isNotEmpty == false
                          ? "Boş Bırakılamaz"
                          : "",
                      helperStyle: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                DefaultButton(
                  text: _kaydet,
                  press: isActive == false
                      ? null
                      : () {
                          if (soru1.value.text.isNotEmpty) {
                            Navigator.pop<BasAgrisiNotModel>(
                              context,
                              model,
                            );
                          } else {}
                        },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
