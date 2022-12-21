import 'package:bas_agrisi_takip_sistemi/ornekSorular/sorular.dart';
import 'package:flutter/material.dart';

import '../../constants/all_border_radius.dart';
import '../../constants/constant.dart';
import '../../models/kadin_hastalara_ozel_model.dart';
import '../../widgets/question_text_card.dart';

class KadinhastalarPage extends StatefulWidget {
  const KadinhastalarPage({Key? key}) : super(key: key);
  static String routeName = "/kadin_hastalar_page";

  @override
  State<KadinhastalarPage> createState() => _KadinhastalarPageState();
}

class _KadinhastalarPageState extends State<KadinhastalarPage> {
  int currentStep = 0;
  bool isComplated = false;
  bool isOkey = false;
  final soru1 = TextEditingController();

  late final List<KadinHastaModel> _soru;
  @override
  void initState() {
    super.initState();
    _soru = kadinHastalarIcinSoru;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kadin Hastalara Ozel",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Theme(
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
                          borderRadius: BorderRadius.circular(defaultRadius),
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
          subtitle: const Text("Ozel"),
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text("Soru 1"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              const QuestionTextCard(question: "Kadinlara ozel Sorular"),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: _soru.length,
                  itemBuilder: (context, index) {
                    return buildSingleCheckbox(_soru[index]);
                  },
                ),
              ),
              const SizedBox(height: 10),
              if (isOkey)
                AnimatedContainer(
                  height: isOkey == true ? 70 : 0,
                  duration: const Duration(milliseconds: 1000),
                  child: TextFormField(
                    controller: soru1,
                    decoration: const InputDecoration(
                      labelText: "Diger",
                      hintText: "Zaman olarak Belirtiniz",
                    ),
                  ),
                )
              else
                AnimatedContainer(
                  height: isOkey == true ? 70 : 0,
                  duration: const Duration(milliseconds: 1000),
                  color: Colors.red,
                ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text("Soru 2"),
          content: Column(
            children: const [],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text("comlate"),
          content: Container(
            color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Bilgiler Kaydedilecek Lutfen BEKLEYIN"),
                Text(soru1.value.text)
              ],
            ),
          ),
        ),
      ];
  Widget buildSingleCheckbox(KadinHastaModel model) => buildCheckbox(
      model: model,
      onClicked2: () {
        setState(() {
          final newValue2 = !model.evet;
          model.evet = newValue2;
          model.hayir = false;
          if (model.id == 6) {
            isOkey = true;
          }
        });
      },
      onClicked: () {
        setState(() {
          final newValue = !model.hayir;
          model.hayir = newValue;
          model.evet = false;
          if (model.id == 6) {
            isOkey = false;
            soru1.clear();
          }
        });
      });

  Widget buildCheckbox({
    required KadinHastaModel model,
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
                model.durum,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Evet"),
                      Checkbox(
                        activeColor: kMyPrimaryColor,
                        value: model.evet,
                        onChanged: (value) => onClicked2(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Hayir"),
                      Checkbox(
                        activeColor: kMyPrimaryColor,
                        value: model.hayir,
                        onChanged: (value) => onClicked(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
