import 'package:flutter/material.dart';
import '../../constants/all_border_radius.dart';
import '../../constants/constant.dart';
import '../../models/genel_saglik_sorunlari_model.dart';
import '../../ornekSorular/sorular.dart';
import '../../widgets/question_text_card.dart';

class GenelSaglikSorunlari extends StatefulWidget {
  const GenelSaglikSorunlari({Key? key}) : super(key: key);
  static String routeName = "/genel_saglik_sorunlari";

  @override
  State<GenelSaglikSorunlari> createState() => _GenelSaglikSorunlariState();
}

class _GenelSaglikSorunlariState extends State<GenelSaglikSorunlari> {
  final String _soruText = "Genel Saglik problemlerinizi Asagidan seciniz.";
  final String _soruText2 =
      "1. sorudaki rahatsizliklar icin kullandiginiz ilaclar nelerder?";
  final soru1 = TextEditingController();
  final soru2 = TextEditingController();
  late final List<GenelSaglikSorunlariModel> _genelSaglikSoru;
  @override
  void initState() {
    super.initState();
    _genelSaglikSoru = saglikProblemleri;
  }

  int currentStep = 0;
  bool isComplated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Genel Saglik Sorunlari",
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
          subtitle: const Text("Genel Saglik Problemleri"),
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text("Soru 1"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: _soruText),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: _genelSaglikSoru.length,
                  itemBuilder: (context, index) {
                    return buildSingleCheckbox(_genelSaglikSoru[index]);
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text("Soru 2"),
          subtitle: const Text("1 sorunun devami"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: _soruText2),
              const SizedBox(height: 10),
              TextFormField(
                controller: soru1,
                decoration: const InputDecoration(
                  hintText: "kullanilan ilaclar",
                ),
              ),
              const SizedBox(height: 10),
            ],
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
  Widget buildSingleCheckbox(GenelSaglikSorunlariModel model) => buildCheckbox(
      model: model,
      onClicked2: () {
        setState(() {
          final newValue2 = !model.bugunMevcutOlan;
          model.bugunMevcutOlan = newValue2;
        });
      },
      onClicked: () {
        setState(() {
          final newValue = !model.gecmisteYasananOlan;
          model.gecmisteYasananOlan = newValue;
        });
      });

  Widget buildCheckbox({
    required GenelSaglikSorunlariModel model,
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
                model.saglikProblemi,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Gecmiste Yasanan OLAN"),
                  Checkbox(
                    activeColor: kMyPrimaryColor,
                    value: model.bugunMevcutOlan,
                    onChanged: (value) => onClicked2(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Bugun mevcut OLAN "),
                  Checkbox(
                    activeColor: kMyPrimaryColor,
                    value: model.gecmisteYasananOlan,
                    onChanged: (value) => onClicked(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
