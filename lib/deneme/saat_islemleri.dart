// ignore_for_file: avoid_print

import '../screens/statistics/provider/model/istatik_model.dart';

void main() {
  // var now = DateTime.now();
  // print(now);
  // print("Yıl-Ay-Gün Saat:Dakika:Saniye.Milisaniye");

  // print("*************************************");
  // print("Yıl : ${now.year}");
  // print("Ay  : ${now.month}");
  // print("Gün : ${now.day}");
  // print("Gün : ${now.hour}");
  // print("Gün : ${now.day}");

  List<IstatikModel> list = [
    IstatikModel(ay: 1, deger: 0),
    IstatikModel(ay: 2, deger: 0),
    IstatikModel(ay: 3, deger: 0),
    IstatikModel(ay: 4, deger: 0),
    IstatikModel(ay: 5, deger: 0),
    IstatikModel(ay: 7, deger: 0),
    IstatikModel(ay: 8, deger: 0),
    IstatikModel(ay: 9, deger: 0),
    IstatikModel(ay: 10, deger: 0),
    IstatikModel(ay: 11, deger: 0),
    IstatikModel(ay: 12, deger: 0),
    IstatikModel(ay: 13, deger: 0),
  ];
  print(list.length);

  for (int i = 0; i < 50; i++) {
    switch (1) {
      case 1:
        list[0].deger++;
        break;
      case 2:
        list[1].deger++;
        break;
      case 3:
        list[2].deger++;
        break;
      case 4:
        list[3].deger++;
        break;
      case 5:
        list[4].deger++;
        break;
      case 6:
        list[5].deger++;
        break;
      case 7:
        list[6].deger++;
        break;
      case 8:
        list[7].deger++;
        break;
      case 9:
        list[8].deger++;
        break;
      case 10:
        list[9].deger++;
        break;
      case 11:
        list[10].deger++;
        break;
      case 12:
        list[11].deger++;
        break;
    }
  }

  for (int i = 0; i <= 12; i++) {
    print("${i + 1} ${list[i].deger}");
  }
}
