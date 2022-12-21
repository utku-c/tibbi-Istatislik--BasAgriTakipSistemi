//! Hastanın eski yıllarda kullandığı
//! ilaçlar listesi için model oluşturuldu.

class IlacModel {
  String ilacAdi;
  bool faydaliOldu;
  bool faydaliOlmadi;
  IlacModel({
    required this.ilacAdi,
    this.faydaliOldu = false,
    this.faydaliOlmadi = false,
  });
}
