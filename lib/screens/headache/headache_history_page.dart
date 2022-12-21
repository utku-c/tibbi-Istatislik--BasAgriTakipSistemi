import 'package:bas_agrisi_takip_sistemi/constants/constant.dart';
import 'package:bas_agrisi_takip_sistemi/models/ilac_model.dart';
import 'package:flutter/material.dart';
import '../../constants/all_border_radius.dart';
import '../../ornekSorular/sorular.dart';
import '../../widgets/question_text_card.dart';

class HeadAcheHistoryPage extends StatefulWidget {
  const HeadAcheHistoryPage({Key? key}) : super(key: key);
  static String routeName = "/headache_history";

  @override
  State<HeadAcheHistoryPage> createState() => _HeadAcheHistoryPageState();
}

class _HeadAcheHistoryPageState extends State<HeadAcheHistoryPage> {
  final allowIlaclar = IlacModel(ilacAdi: "Hepsini sec");
  final ilacSorular = [
    IlacModel(ilacAdi: "Dideral / Beloc / Tensinor"),
    IlacModel(ilacAdi: "Topamax / Xamate"),
    IlacModel(ilacAdi: "Sibelium"),
    IlacModel(ilacAdi: "Depakin / Convulex / Valposim"),
    IlacModel(ilacAdi: "Laroxyl"),
    IlacModel(ilacAdi: "Sandomigran"),
    IlacModel(ilacAdi: "Relpax"),
    IlacModel(ilacAdi: "Maxalt"),
    IlacModel(ilacAdi: "Dideral / Beloc / Tensinor"),
    IlacModel(ilacAdi: "İmigran"),
    IlacModel(ilacAdi: "Avmigran"),
    IlacModel(ilacAdi: "Zomig"),
    IlacModel(ilacAdi: "Avmigran"),
    IlacModel(ilacAdi: "Aspirin"),
    IlacModel(ilacAdi: "Majezik"),
    IlacModel(ilacAdi: "Vermidon/Parol/ Termalgine/Minoset"),
    IlacModel(ilacAdi: "Apranax"),
    IlacModel(ilacAdi: "Sirdalud"),
    IlacModel(ilacAdi: "Antidepresanlar"),
    IlacModel(ilacAdi: "Diğer…"),
  ];

  late final List<String> _genelSoru;
  @override
  void initState() {
    super.initState();
    _genelSoru = questionListItem;
  }

  final String _labelText = "Tiklayiniz";
  final List<String> kullanilanIlaclar = [];

  int currentStep = 0;
  bool isComplated = false;
  final soru1 = TextEditingController();
  final soru2 = TextEditingController();
  final soru3 = TextEditingController();
  final soru4 = TextEditingController();
  final soru5 = TextEditingController();
  final soru6 = TextEditingController();
  final soru7 = TextEditingController();
  final soru8 = TextEditingController();
  final soru9 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gecmisteki Bas Agrilariniz",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: isComplated == true
          ? const CircularProgressIndicator()
          : Theme(
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
                onStepTapped: (value) => setState(() => currentStep = value),

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
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius),
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
              QuestionTextCard(question: _genelSoru[0].toString()),
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
              QuestionTextCard(question: _genelSoru[1].toString()),
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
              QuestionTextCard(question: _genelSoru[2].toString()),
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
              QuestionTextCard(question: _genelSoru[3].toString()),
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
              QuestionTextCard(question: _genelSoru[4].toString()),
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
              QuestionTextCard(question: _genelSoru[5].toString()),
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
              QuestionTextCard(question: _genelSoru[6].toString()),
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
              QuestionTextCard(question: _genelSoru[7].toString()),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: ilacSorular.length,
                  itemBuilder: (context, index) {
                    return buildSingleCheckbox(ilacSorular[index]);
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 8,
          title: const Text("comlate"),
          content: Container(
            color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Bilgiler Kaydedilecek Lutfen BEKLEYIN"),
                Text("Ad: ${soru1.value.text}"),
                Text("soyad: ${soru2.value.text}"),
                for (int i = 0; i < kullanilanIlaclar.length; i++)
                  Text("soyad: ${kullanilanIlaclar[i]}"),
              ],
            ),
          ),
        ),
      ];

  // kullanılmıyor
  Widget buildtoggleCheckBox(IlacModel model) => buildCheckbox(
        model: model,
        onClicked: () {
          final newVal = !model.faydaliOldu;
          setState(() {
            allowIlaclar.faydaliOldu = newVal;
            for (var element in ilacSorular) {
              element.faydaliOldu = newVal;
            }
            if (!newVal) {
              allowIlaclar.faydaliOldu = false;
            } else {
              final allow = ilacSorular.every((model) => model.faydaliOldu);
              allowIlaclar.faydaliOldu = allow;
            }
          });
        },
        onClicked2: () {},
      );
  Widget buildSingleCheckbox(IlacModel model) => buildCheckbox(
      model: model,
      onClicked2: () {
        setState(() {
          final newValue2 = !model.faydaliOlmadi;
          model.faydaliOlmadi = newValue2;
        });
      },
      onClicked: () {
        setState(() {
          final newValue = !model.faydaliOldu;
          model.faydaliOldu = newValue;
        });
      });

  Widget buildCheckbox({
    required IlacModel model,
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
                model.ilacAdi,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Kullandim Faydali Oldu "),
                  Checkbox(
                    activeColor: kMyPrimaryColor,
                    value: model.faydaliOldu,
                    onChanged: (value) => onClicked(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Kullandim Faydali Olmadi "),
                  Checkbox(
                    activeColor: kMyPrimaryColor,
                    value: model.faydaliOlmadi,
                    onChanged: (value) => onClicked2(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
