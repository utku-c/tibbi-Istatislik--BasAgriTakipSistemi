import '../models/bas_agrilari_soru_model.dart';
import '../models/genel_saglik_sorunlari_model.dart';
import '../models/kadin_hastalara_ozel_model.dart';
import '../screens/profile/widgets/profile_menu_item.dart';

final List<BasAgrilariSoruModel> basAgrilariSorulari = [
  BasAgrilariSoruModel(
    id: 1,
    soruAdi: "Başağrılarınız genellikle; tek taraflı mı olur, çift taraflı mı?",
  ),
  BasAgrilariSoruModel(
    id: 2,
    soruAdi:
        "Başağrılarınız hangi niteliktedir? (örneğin; zonklayıcı, künt, mengene ile sıkılır gibi vb.)",
  ),
  BasAgrilariSoruModel(
    id: 3,
    soruAdi:
        "Başağrınızın şiddeti genellikle ne derecededir? (eğer işinize konsantrasyonunuzu engelliyorsa orta; ağrı sırasında hiçbir şey yapamıyorsanız, şiddetli olarak sınıflandırınız)",
  ),
  BasAgrilariSoruModel(
    id: 4,
    soruAdi:
        "Merdiven çıkmak, koşmak gibi aktiviteler başağrınızı arttırır mı?",
  ),
  BasAgrilariSoruModel(
    id: 5,
    soruAdi: "Başağrınıza iştahsızlık eşlik eder mi?",
  ),
  BasAgrilariSoruModel(
    id: 6,
    soruAdi: "Başağrınıza bulantı ve/veya kusma eşlik eder mi?",
  ),
  BasAgrilariSoruModel(
    id: 7,
    soruAdi:
        "Başağrınız sırasında ışık ağrınızı arttırır mı ya da, başağrınız sırasında loş/karanlık bir ortam tercih eder misiniz?",
  ),
  BasAgrilariSoruModel(
    id: 8,
    soruAdi:
        "Başağrınız sırasında, daha önce rahatsız etmeyecek derecedeki sesler sizi rahatsız eder mi ya da başağrınız sırasında sessiz bir ortamı tercih eder misiniz?",
  ),
  BasAgrilariSoruModel(
    id: 9,
    soruAdi:
        "Aşağıdakilerden özellikle başağrısını tetikleyen bir faktör var sa, işaretlenmelidir.",
  ),
];

final List<AgriTetikleyiciModel> tetkileyiciSorular = [
  AgriTetikleyiciModel(id: 1, tetikleyiciAdi: "Adet Dönemi"),
  AgriTetikleyiciModel(id: 2, tetikleyiciAdi: "Stres"),
  AgriTetikleyiciModel(id: 3, tetikleyiciAdi: "Öğün Atlamak/Geciktirmek"),
  AgriTetikleyiciModel(id: 4, tetikleyiciAdi: "Az Uyumak"),
  AgriTetikleyiciModel(id: 5, tetikleyiciAdi: "Çok Uyumak"),
  AgriTetikleyiciModel(id: 6, tetikleyiciAdi: "Parlak/Yanıp-Sönen Işıklar"),
  AgriTetikleyiciModel(id: 7, tetikleyiciAdi: "Televizyon/Video Oyunları"),
  AgriTetikleyiciModel(id: 8, tetikleyiciAdi: "Keskin Kokular"),
  AgriTetikleyiciModel(id: 9, tetikleyiciAdi: "Fizik Eksersiz"),
  AgriTetikleyiciModel(id: 10, tetikleyiciAdi: "Hava Şartları (lodos vb)"),
  AgriTetikleyiciModel(id: 11, tetikleyiciAdi: "Alkol"),
  AgriTetikleyiciModel(id: 12, tetikleyiciAdi: "Yiyecekler (çikolata vb.)"),
];

final List<GenelSaglikSorunlariModel> saglikProblemleri = [
  GenelSaglikSorunlariModel(id: 1, saglikProblemi: "Epilepsi (sara)"),
  GenelSaglikSorunlariModel(id: 2, saglikProblemi: "Astım"),
  GenelSaglikSorunlariModel(id: 3, saglikProblemi: "Şeker Hastalığı"),
  GenelSaglikSorunlariModel(id: 4, saglikProblemi: "Yüksek Tansiyon"),
  GenelSaglikSorunlariModel(id: 5, saglikProblemi: "Boyun Fıtığı/Ağrısı"),
  GenelSaglikSorunlariModel(id: 6, saglikProblemi: "Sinüzit"),
  GenelSaglikSorunlariModel(id: 7, saglikProblemi: "Mide Rahatsızlığı"),
  GenelSaglikSorunlariModel(id: 8, saglikProblemi: "Ameliyat"),
  GenelSaglikSorunlariModel(id: 9, saglikProblemi: "Tiroid Bezi Hastalığı"),
  GenelSaglikSorunlariModel(id: 10, saglikProblemi: "Anemi (kansızlık)"),
  GenelSaglikSorunlariModel(id: 11, saglikProblemi: "Unutkanlık"),
  GenelSaglikSorunlariModel(id: 12, saglikProblemi: "Uykusuzluk"),
  GenelSaglikSorunlariModel(id: 13, saglikProblemi: "Horlama"),
  GenelSaglikSorunlariModel(id: 14, saglikProblemi: "Depresyon"),
  GenelSaglikSorunlariModel(id: 15, saglikProblemi: "Vitamin Eksikliği"),
  GenelSaglikSorunlariModel(id: 16, saglikProblemi: "Polinöropati"),
  GenelSaglikSorunlariModel(id: 17, saglikProblemi: "Tremor "),
  GenelSaglikSorunlariModel(id: 18, saglikProblemi: "Diş Hastalıkları"),
  GenelSaglikSorunlariModel(id: 19, saglikProblemi: "Diş Gıcırdatm"),
  GenelSaglikSorunlariModel(id: 20, saglikProblemi: "Göz bozukluğu"),
  GenelSaglikSorunlariModel(id: 21, saglikProblemi: "Glokom (göz tansiyonu)"),
  GenelSaglikSorunlariModel(id: 22, saglikProblemi: "Romatizmal Hastalıklar"),
  GenelSaglikSorunlariModel(id: 23, saglikProblemi: "Böbrek Taşı"),
  GenelSaglikSorunlariModel(id: 24, saglikProblemi: "Menenjit"),
  GenelSaglikSorunlariModel(id: 25, saglikProblemi: "Kalb Hastalıgı"),
  GenelSaglikSorunlariModel(id: 26, saglikProblemi: "Kontipasyon (kabızlık)"),
  GenelSaglikSorunlariModel(id: 27, saglikProblemi: "Alerji (ilaçlar dahil)"),
  GenelSaglikSorunlariModel(id: 28, saglikProblemi: "Hepatit (sarılık)"),
  GenelSaglikSorunlariModel(id: 29, saglikProblemi: "Diğer…"),
];

final List<String> questionListItem = [
  "Başağrılarınız ilk basladığında kaç yaşındaydınız?",
  "Daha önce başağrılarınız nedeniyle doktora gittiniz mi?",
  "Başağrısı nedeniyle muayene olduğunuz doktor(ların) uzmanlık alan(lar)ı neydi?",
  "Başağrınız için hangi tanı(lar) koyuldu?",
  "Başağrınız için hangi tetkikler yapıldı? (örneğin; beyin filmi, kan tetkiki vb)",
  "Bugüne kadar başağrınız için ne gibi tedaviler aldınız ? (örneğin; ilaç, botulinum toksini, akupunktur, masaj, fizik tedavi, bitkisel ilaçlar, alternatif tedaviler…)",
  "Bugüne kadar görmüş olduğunuz tedavilerden en fazla hangisinden faydalandınız?",
  "Aşağıda adı geçen başağrısı ile ilgili ilaçları daha önce kullanıldıys, karşısına işaretlenmelidir.",
];

final List<KadinHastaModel> kadinHastalarIcinSoru = [
  KadinHastaModel(id: 1, durum: "Bebek emziriyor musunuz?"),
  KadinHastaModel(id: 2, durum: "Gebe misiniz?"),
  KadinHastaModel(id: 3, durum: "Hamileliği Düşünüyor musunuz?"),
  KadinHastaModel(id: 4, durum: "Doğum Kontrol İlacı kullanıyor musunuz? "),
  KadinHastaModel(id: 5, durum: "Ağrılarınız Adet Döneminde Yoğunlaşıyor mu"),
  KadinHastaModel(id: 6, durum: "Her Adet Döneminizde Başağrınız Oluyor mu"),
];

List<ProfileMenuItem> basAgrisiDurumlari = [
  const ProfileMenuItem(
    text: "Belirtiler",
    icon: "assets/icons/agri_kaydi_belirtiler.svg",
  ),
  const ProfileMenuItem(
    text: "İlaçlar",
    icon: "assets/icons/agri_kaydi_ilaclar.svg",
  ),
  const ProfileMenuItem(
    text: "Tetikleyiciler",
    icon: "assets/icons/agri_kaydi_tetikleyici.svg",
  ),
  const ProfileMenuItem(
    text: "Notlar",
    icon: "assets/icons/agri_kaydi_notlar.svg",
  ),
  const ProfileMenuItem(
    text: "Ağrı Şiddeti",
    icon: "assets/icons/agri_kaydi_bas_agrisi_derecesi.svg",
  ),
  // const ProfileMenuItem(
  //   text: "Baş Ağrısı",
  //   icon: "assets/icons/agri_kaydi_bas_agrisi.svg",
  // ),
];
