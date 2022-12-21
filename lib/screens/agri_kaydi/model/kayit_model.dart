import 'bas_agrisi_belirtiler.dart';
import 'bas_agrisi_model.dart';
import 'bas_agrisi_not_model.dart';
import 'kullanilan_ilaclar.dart';
import 'tetikleyici_model.dart';

class KayitModel {
  int id;
  DateTime kayitTarihi;
  List<BasAgrisiBelirtiModel> basAgriBelirti;
  List<KullanilanIlacModel> basAgriIlac;
  List<TetikleyiciModel> basAgriTetikleyici;
  BasAgrisiNotModel not;
  BasAgriDereceModel derece;
  KayitModel({
    required this.id,
    required this.kayitTarihi,
    required this.basAgriBelirti,
    required this.basAgriIlac,
    required this.basAgriTetikleyici,
    required this.not,
    required this.derece,
  });
}
