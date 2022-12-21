class BasAgrilariSoruModel {
  int id;
  String soruAdi;
  String soruCevap;
  bool evet;

  BasAgrilariSoruModel({
    required this.id,
    required this.soruAdi,
    this.soruCevap = "",
    this.evet = false,
  });
}

class AgriTetikleyiciModel {
  int id;
  String tetikleyiciAdi;
  bool evet;
  bool hayir;
  AgriTetikleyiciModel({
    required this.id,
    required this.tetikleyiciAdi,
    this.evet = false,
    this.hayir = false,
  });
}
