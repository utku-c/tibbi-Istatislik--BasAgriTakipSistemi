import 'package:flutter/material.dart';

import '../../../agri_kaydi/model/bas_agrisi_model.dart';
import '../../../agri_kaydi/model/bas_agrisi_not_model.dart';
import '../../../agri_kaydi/model/kayit_model.dart';

class StatistickModel with ChangeNotifier {
  final List<KayitModel> _kayitList = [
    KayitModel(
      id: 1,
      kayitTarihi: DateTime.now(),
      basAgriBelirti: [],
      basAgriIlac: [],
      basAgriTetikleyici: [],
      not: BasAgrisiNotModel(not: "adawdawd"),
      derece: BasAgriDereceModel(isOkey: true, value: 5),
    ),
  ];

  List<KayitModel> get tumKayit => _kayitList;

  addList(KayitModel kayitModel) {
    _kayitList.insert(0, kayitModel);
    notifyListeners();
  }
}
