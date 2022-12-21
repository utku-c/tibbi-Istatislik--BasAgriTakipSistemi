import 'package:flutter/material.dart';
import '../../../constants/constant.dart';
import '../../../constants/default_button.dart';
import '../model/tetikleyici_model.dart';

class TetikleyicilerSayfasi extends StatefulWidget {
  const TetikleyicilerSayfasi({Key? key}) : super(key: key);
  static String routeName = "/bas_agrisi_tetikleyiciler";

  @override
  State<TetikleyicilerSayfasi> createState() => _TetikleyicilerSayfasiState();
}

class _TetikleyicilerSayfasiState extends State<TetikleyicilerSayfasi> {
  final List<TetikleyiciModel> _soru = [
    TetikleyiciModel(tetikleyen: "Alkol", etki: false),
    TetikleyiciModel(tetikleyen: "Çikolata", etki: false),
    TetikleyiciModel(tetikleyen: "Sigara", etki: false),
    TetikleyiciModel(tetikleyen: "Stres", etki: false),
    TetikleyiciModel(tetikleyen: "Sıcaklık", etki: false),
    TetikleyiciModel(tetikleyen: "Atlanan Öğün", etki: false),
    TetikleyiciModel(tetikleyen: "diğer", etki: false),
    TetikleyiciModel(tetikleyen: "diğer", etki: false),
  ];
  final String _kaydet = "Kaydet";

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
            "Baş Ağrınızı tetikleyen durumları seçin",
            style: TextStyle(fontSize: 22),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: _soru.length,
                  itemBuilder: (context, index) {
                    return buildSingleCheckbox(_soru[index]);
                  },
                ),
              ),
              DefaultButton(
                text: _kaydet,
                press: () {
                  Navigator.pop<List<TetikleyiciModel>>(
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

  Widget buildSingleCheckbox(TetikleyiciModel model) => buildCheckbox(
      model: model,
      onClicked: () {
        setState(() {
          final newValue = !model.etki;
          model.etki = newValue;
        });
      });

  Widget buildCheckbox({
    required TetikleyiciModel model,
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
                    model.tetikleyen,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Checkbox(
                    activeColor: kMyPrimaryColor,
                    value: model.etki,
                    onChanged: (value) => onClicked(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
