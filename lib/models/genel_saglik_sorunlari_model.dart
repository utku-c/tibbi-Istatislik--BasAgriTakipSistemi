class GenelSaglikSorunlariModel {
  int id;
  String saglikProblemi;
  bool gecmisteYasananOlan;
  bool bugunMevcutOlan;
  GenelSaglikSorunlariModel({
    required this.id,
    required this.saglikProblemi,
    this.gecmisteYasananOlan = false,
    this.bugunMevcutOlan = false,
  });
}
