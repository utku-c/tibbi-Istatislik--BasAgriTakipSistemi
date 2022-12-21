class KadinHastaModel {
  int id;
  String durum;
  bool evet;
  bool hayir;
  KadinHastaModel({
    required this.id,
    required this.durum,
    this.evet = false,
    this.hayir = false,
  });
}
