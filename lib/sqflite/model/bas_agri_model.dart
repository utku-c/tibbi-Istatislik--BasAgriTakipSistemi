import 'package:bas_agrisi_takip_sistemi/sqflite/utils/db_helper.dart';

class BasAgri {
  int? id;
  String? date;
  int? siddet;

  BasAgri(
    this.id,
    this.date,
    this.siddet,
  );

  BasAgri.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    date = map['date'];

    siddet = map['siddet'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnDate: date,
      DatabaseHelper.columnSiddet: siddet,
    };
  }
}
