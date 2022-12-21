import 'package:flutter/material.dart';
import '../../constants/all_border_radius.dart';
import '../../constants/constant.dart';
import '../../models/bas_agrilari_soru_model.dart';
import '../../ornekSorular/sorular.dart';
import '../../widgets/question_text_card.dart';

class BasAgrilariSoruPage extends StatefulWidget {
  const BasAgrilariSoruPage({Key? key}) : super(key: key);

  @override
  State<BasAgrilariSoruPage> createState() => _BasAgrilariSoruPageState();
  static String routeName = "/bas_agrilari_sorulari_sayfasi";
}

class _BasAgrilariSoruPageState extends State<BasAgrilariSoruPage> {
  int currentStep = 0;
  bool isComplated = false;
  var now = DateTime.now();
  final String _labelText = "Detayli bir aciklama yaziniz";

  final soru1 = TextEditingController();
  final soru2 = TextEditingController();
  final soru3 = TextEditingController();
  final soru4 = TextEditingController();
  final soru5 = TextEditingController();
  final soru6 = TextEditingController();
  final soru7 = TextEditingController();
  final soru8 = TextEditingController();

  late final List<BasAgrilariSoruModel> _basAgrilariSorulari;
  late final List<AgriTetikleyiciModel> _agriTetikleyiciSorular;
  @override
  void initState() {
    super.initState();
    _basAgrilariSorulari = basAgrilariSorulari;
    _agriTetikleyiciSorular = tetkileyiciSorular;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Baş Ağrısı Ekle",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: kMyPrimaryTextColor,
              child: Text(
                "${now.year}.${now.month}.${now.day}  -  ${now.hour}:${now.minute}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 500,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: kMyPrimaryColor,
                    ),
                  ),
                  child: Stepper(
                    type: StepperType.vertical,
                    steps: getSteps(),
                    currentStep: currentStep,
                    onStepContinue: () {
                      final isLastStep = currentStep == getSteps().length - 1;
                      if (isLastStep) {
                        setState(() {
                          isComplated = true;
                        });
                        // ignore: avoid_print
                        print("complated");
                      } else {
                        setState(() {
                          currentStep += 1;
                        });
                      }
                    },

                    ///
                    ///cancel butonuna tıklandığında geri gidecek
                    ///ama 0 ise gitmeyecek
                    onStepCancel: () {
                      currentStep == 0
                          ? null
                          : setState(() {
                              currentStep -= 1;
                            });
                    },

                    ///
                    /// Tabin üstüne tıklandığında
                    ///  ilgili tab açılacak
                    onStepTapped: (value) =>
                        setState(() => currentStep = value),

                    ///
                    //
                    controlsBuilder: (context, details) {
                      final isLastStep = currentStep == getSteps().length - 1;

                      return Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kMyPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius),
                                  ),
                                ),
                                onPressed: () {
                                  if (isLastStep) {
                                    // ignore: avoid_print
                                    print("complated");
                                  } else {
                                    setState(() {
                                      currentStep += 1;
                                    });
                                  }
                                },
                                child: Text(isLastStep ? "Confirm" : "Next"),
                              ),
                            ),
                            const SizedBox(width: 12),
                            if (currentStep != 0)
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kMyPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            defaultRadius),
                                        // side: const BorderSide(
                                        //   color: kMyPrimaryBlack,
                                        //   width: 3.0,
                                        // ),
                                      )),
                                  onPressed: () {
                                    currentStep == 0
                                        ? null
                                        : setState(() {
                                            currentStep -= 1;
                                          });
                                  },
                                  child: const Text("Back"),
                                ),
                              )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          subtitle: const Text("Kucuk bilgilendirme"),
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text("Soru 1"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: _basAgrilariSorulari[0].soruAdi),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: soru1,
                decoration: InputDecoration(hintText: _labelText),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text("Soru 2"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: _basAgrilariSorulari[1].soruAdi),
              const SizedBox(height: 10),
              TextFormField(
                controller: soru2,
                decoration: InputDecoration(hintText: _labelText),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text("Soru 3"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: _basAgrilariSorulari[2].soruAdi),
              const SizedBox(height: 10),
              TextFormField(
                controller: soru3,
                decoration: InputDecoration(hintText: _labelText),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const Text("Soru 4"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: _basAgrilariSorulari[3].soruAdi),
              const SizedBox(height: 10),
              TextFormField(
                controller: soru4,
                decoration: InputDecoration(hintText: _labelText),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Step(
          state: currentStep > 4 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 4,
          title: const Text("Soru 5"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: _basAgrilariSorulari[4].soruAdi),
              const SizedBox(height: 10),
              TextFormField(
                controller: soru5,
                decoration: InputDecoration(hintText: _labelText),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Step(
          state: currentStep > 5 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 5,
          title: const Text("Soru 6"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: _basAgrilariSorulari[5].soruAdi),
              const SizedBox(height: 10),
              TextFormField(
                controller: soru6,
                decoration: InputDecoration(hintText: _labelText),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Step(
          state: currentStep > 6 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 6,
          title: const Text("Soru 7"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: _basAgrilariSorulari[6].soruAdi),
              const SizedBox(height: 10),
              TextFormField(
                controller: soru7,
                decoration: InputDecoration(hintText: _labelText),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Step(
          state: currentStep > 7 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 7,
          title: const Text("Soru 8"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: _basAgrilariSorulari[7].soruAdi),
              const SizedBox(height: 10),
              TextFormField(
                controller: soru8,
                decoration: InputDecoration(hintText: _labelText),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Step(
          state: currentStep > 8 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 8,
          title: const Text("Soru 9"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: _basAgrilariSorulari[8].soruAdi),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: _agriTetikleyiciSorular.length,
                  itemBuilder: (context, index) {
                    return buildSingleCheckbox(_agriTetikleyiciSorular[index]);
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 9,
          title: const Text("comlate"),
          content: Container(
            color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Bilgiler Kaydedilecek Lutfen BEKLEYIN"),
                Text("Ad: ${soru1.value.text}"),
                Text("soyad: ${soru2.value.text}"),
                Text("soyad: ${soru3.value.text}"),
                Text("soyad: ${soru4.value.text}"),
                Text("soyad: ${soru5.value.text}"),
                Text("soyad: ${soru6.value.text}"),
                Text("soyad: ${soru7.value.text}"),
                Text("soyad: ${soru8.value.text}"),
              ],
            ),
          ),
        ),
      ];

  Widget buildSingleCheckbox(AgriTetikleyiciModel model) => buildCheckbox(
      model: model,
      onClicked2: () {
        setState(() {
          final newValue2 = !model.hayir;
          model.hayir = newValue2;
          model.evet = false;
        });
      },
      onClicked: () {
        setState(() {
          final newValue = !model.evet;
          model.evet = newValue;
          model.hayir = false;
        });
      });

  Widget buildCheckbox({
    required AgriTetikleyiciModel model,
    required VoidCallback onClicked,
    required VoidCallback onClicked2,
  }) =>
      Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kMyPrimaryTextColor.withOpacity(0.5),
          ),
          height: 160,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                model.tetikleyiciAdi,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Evet Etkiliyor"),
                  Checkbox(
                    activeColor: kMyPrimaryColor,
                    value: model.evet,
                    onChanged: (value) => onClicked(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Hayir Etkilemiyor"),
                  Checkbox(
                    activeColor: kMyPrimaryColor,
                    value: model.hayir,
                    onChanged: (value) => onClicked2(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
