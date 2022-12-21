// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../constants/constant.dart';
import '../../constants/default_button.dart';
import '../../models/bas_agrisi_geri_donus_model.dart';
import '../../ornekSorular/sorular.dart';
import '../../sqflite/model/bas_agri_model.dart';
import '../../sqflite/utils/db_helper.dart';
import '../profile/widgets/profile_menu_item.dart';
import '../statistics/provider/state/statistick_state.dart';
import 'model/bas_agrisi_belirtiler.dart';
import 'model/bas_agrisi_model.dart';
import 'model/bas_agrisi_not_model.dart';
import 'model/kayit_model.dart';
import 'model/kullanilan_ilaclar.dart';
import 'model/tetikleyici_model.dart';
import 'screens/bas_agri_siddeti.dart';
import 'screens/bas_agrisi_belirtiler_sayfasi.dart';
import 'screens/bas_agrisi_tetikleyiciler.dart';
import 'screens/kullanilan_ilaclar.dart';
import 'screens/notlar_sayfasi.dart';
import 'widgets/bas_agrisi_menu_items.dart';

class AgriKaydiEkle extends StatefulWidget {
  const AgriKaydiEkle({Key? key}) : super(key: key);
  static String routeName = "/agri_kaydi_ekle";

  @override
  State<AgriKaydiEkle> createState() => _AgriKaydiEkleState();
}

class _AgriKaydiEkleState extends State<AgriKaydiEkle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final String addUrl = "assets/icons/agri_kaydi_add_note.svg";
  final String okeyUrl = "assets/icons/agri_kaydi_okey.svg";
  final String lottiUrl = "assets/json/accept.json";
  int selectedIndex = 0;
  bool _kayitolusturButton = false;
  late final List<ProfileMenuItem> _basAgrisiDurumlari;
  final dbHelper = DatabaseHelper.instance;

  // ! Kayıt Model
  KayitModel kayitModel = KayitModel(
      id: 1,
      kayitTarihi: DateTime.now(),
      basAgriBelirti: [],
      basAgriIlac: [],
      basAgriTetikleyici: [],
      not: BasAgrisiNotModel(not: ""),
      derece: BasAgriDereceModel(
        value: 0,
        isOkey: false,
      ));

  // ! Kayıt oluştur butonunun aktifleşmesi için durum.
  // ! hepsi true olunca buton aktifleşiyor.
  final List<IsOkey> _isOkey = [
    IsOkey(id: 1, isOkey: false),
    IsOkey(id: 2, isOkey: false),
    IsOkey(id: 3, isOkey: false),
    IsOkey(id: 4, isOkey: false),
    IsOkey(id: 5, isOkey: false),
  ];

  @override
  void initState() {
    super.initState();
    _basAgrisiDurumlari = basAgrisiDurumlari;
    _controller = AnimationController(
      vsync: this,
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> goPage(int index) async {
    switch (index) {
      case 0:
        print("Belirtilere Girdi");
        kayitModel.basAgriBelirti = await Navigator.pushNamed(
          context,
          BasAgrisiBelirtiler.routeName,
        ) as List<BasAgrisiBelirtiModel>;

        if (kayitModel.basAgriBelirti.isNotEmpty) {
          print("Belirtiler if e girdi");
          print("***********************************************");
          // for (var i = 0; i < basAgriBelirti.length; i++) {
          //   print("${basAgriBelirti[i].soru}: ${basAgriBelirti[i].isOkey}");
          // }
          setState(() {
            _isOkey[0].isOkey = true;
          });
        }
        break;
      case 1:
        print("ilaçşlara tıklandı");
        kayitModel.basAgriIlac = await Navigator.pushNamed(
          context,
          KullanilanIlaclar.routeName,
        ) as List<KullanilanIlacModel>;
        if (kayitModel.basAgriIlac.isNotEmpty) {
          print("Kullanılan ilaçlar if e girdi");
          print("***********************************************");
          // for (var i = 0; i < kullanilanIlaclar.length; i++) {
          //   print(
          //       "${kullanilanIlaclar[i].ilacAdi}: ${kullanilanIlaclar[i].faydalioldu}");
          // }
          setState(() {
            _isOkey[1].isOkey = true;
          });
        }

        break;
      case 2:
        print("Tetikleyiciler Sayfasina gidiyor");
        kayitModel.basAgriTetikleyici = await Navigator.pushNamed(
          context,
          TetikleyicilerSayfasi.routeName,
        ) as List<TetikleyiciModel>;
        if (kayitModel.basAgriTetikleyici.isNotEmpty) {
          print("Tetikleyiciler if e girdi");
          print("***********************************************");

          // for (var i = 0; i < tetikleyici.length; i++) {
          //   print("${tetikleyici[i].tetikleyen}: ${tetikleyici[i].etki}");
          // }
          setState(() {
            _isOkey[2].isOkey = true;
          });
        }
        break;
      case 3:
        print("Notlar");
        kayitModel.not = await Navigator.pushNamed(
          context,
          NotlarSayfasi.routeName,
        ) as BasAgrisiNotModel;

        setState(() {
          _isOkey[3].isOkey = true;
        });
        print("***********************************************");
        //print("not model: ${notmodel.not}");

        break;
      case 4:
        print("Ağrı Şiddeti");
        kayitModel.derece = await Navigator.pushNamed(
          context,
          BasAgriSiddeti.routeName,
        ) as BasAgriDereceModel;
        if (kayitModel.derece.isOkey == true) {
          print("***********************************************");
          // print("bas ağrı derecesi : ${basAgriDereceModel.value}");
          setState(() {
            _isOkey[4].isOkey = true;
          });
        }
        break;
      default:
    }
  }

  Future<void> kayitOlustur(List<IsOkey> list) async {
    setState(() {
      _kayitolusturButton = list.every((element) => element.isOkey == true);
    });
  }

  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Baş Ağrısı Kaydı Ekle",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // for (var i = 0; i < basAgriBelirti.length; i++)
            //   Text("${basAgriBelirti[i].soru}: ${basAgriBelirti[i].isOkey}"),
            Text(
              "${now.day}.${now.month}.${now.year}  -  ${now.hour}:${now.minute}",
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: kMyPrimaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 450,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    _basAgrisiDurumlari.length,
                    ((index) => GestureDetector(
                          onTap: () async {
                            await goPage(index);
                            await kayitOlustur(_isOkey);
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            clipBehavior: Clip.none,
                            children: [
                              MyProfileMenuItem(
                                text: _basAgrisiDurumlari[index].text,
                                icon: _basAgrisiDurumlari[index].icon,
                              ),
                              Positioned(
                                right: 15,
                                bottom: 15,
                                child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        side: const BorderSide(
                                          width: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor:
                                          _isOkey[index].isOkey == true
                                              ? Colors.green
                                              : kMyPrimaryTextColor,
                                    ),
                                    onPressed: null,
                                    child: SvgPicture.asset(
                                      _isOkey[index].isOkey == true
                                          ? okeyUrl
                                          : addUrl,
                                      color: _isOkey[index].isOkey == true
                                          ? null
                                          : kMyPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DefaultButton(
                text: "Kayıt Oluştur",
                press: _kayitolusturButton == false
                    ? null
                    : () async {
                        // ? Listeye elemanı ekliyoruz.
                        // ? Sayfayı kapatıyoruz.
                        // Provider.of<StatistickModel>(context, listen: false)
                        //     .addList(kayitModel);
                        // _newMethodShowDialog(context).then(
                        //   (value) => Navigator.pop(context),
                        // );

                        _insert(
                          DateTime.now().toString(),
                          int.parse(kayitModel.derece.value.toString()),
                        );
                        _newMethodShowDialog(context);
                      },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _newMethodShowDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) => Dialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: kMyPrimaryTextColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
              ),
              width: 150,
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 220,
                    height: 220,
                    padding: const EdgeInsets.only(right: 20),
                    child: Lottie.asset(
                      lottiUrl,
                      repeat: false,
                      controller: _controller,
                      onLoaded: (composition) {
                        _controller.duration = composition.duration;
                        _controller.forward();
                      },
                    ),
                  ),
                  const Text(
                    "Kaydedildi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _insert(
    String date,
    int siddet,
  ) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnDate: date,
      DatabaseHelper.columnSiddet: siddet,
    };

    BasAgri basAgri = BasAgri.fromMap(row);
    final id = await dbHelper.insert(basAgri);
    print(id);
    //_showMessageInScaffold("insert row id: $id");
  }
}
