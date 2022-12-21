import 'package:bas_agrisi_takip_sistemi/models/aliskanliklar_model.dart';
import 'package:flutter/material.dart';

import '../../constants/all_border_radius.dart';
import '../../constants/constant.dart';
import '../../widgets/question_text_card.dart';

class AliskanlikPage extends StatefulWidget {
  const AliskanlikPage({Key? key}) : super(key: key);
  static String routeName = "/aliskanliklar";

  @override
  State<AliskanlikPage> createState() => _AliskanlikPageState();
}

class _AliskanlikPageState extends State<AliskanlikPage> {
  int currentStep = 0;
  bool isComplated = false;
  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;
  bool isActive4 = false;
  bool isActive5 = false;
  final soru1 = TextEditingController();
  final soru2 = TextEditingController();
  final soru3 = TextEditingController();
  final soru4 = TextEditingController();
  final soru5 = TextEditingController();

  final List<Aliskanlik> aliskanlikListesi = [
    Aliskanlik(id: 1, aliskanlikAdi: "Sigara Kullaniyor musunuz?"),
    Aliskanlik(id: 2, aliskanlikAdi: "Alkol Kullanıyor musunuz?"),
    Aliskanlik(id: 3, aliskanlikAdi: "Cay, kahve vb. tuketiyor musunuz?"),
    Aliskanlik(id: 4, aliskanlikAdi: "Cikolata Tuketiyor musunuz"),
    Aliskanlik(id: 5, aliskanlikAdi: "Diger Alıskanliklar…"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Aliskanliklar",
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
          subtitle: const Text("Aliskanliklar"),
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text("Soru 1"),
          content: Column(
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: aliskanlikListesi[0].aliskanlikAdi),
              const SizedBox(height: 10),
              buildSingleCheckbox(aliskanlikListesi[0]),
              const SizedBox(height: 16),
              if (isActive1)
                AnimatedContainer(
                  height: isActive1 == true ? 70 : 0,
                  duration: const Duration(milliseconds: 1000),
                  child: TextFormField(
                    controller: soru1,
                    decoration: const InputDecoration(
                      labelText: "Miktar",
                      hintText: "Miktari Yaziniz",
                    ),
                  ),
                )
              else
                AnimatedContainer(
                  height: isActive1 == true ? 70 : 0,
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
            children: [
              const SizedBox(height: 10),
              QuestionTextCard(question: aliskanlikListesi[1].aliskanlikAdi),
              const SizedBox(height: 10),
              buildSingleCheckbox(aliskanlikListesi[1]),
              const SizedBox(height: 10),
              if (isActive2)
                AnimatedContainer(
                  height: isActive2 == true ? 70 : 0,
                  duration: const Duration(milliseconds: 1000),
                  child: TextFormField(
                    controller: soru2,
                    decoration: const InputDecoration(
                      labelText: "Miktar",
                      hintText: "Miktari Yaziniz",
                    ),
                  ),
                )
              else
                AnimatedContainer(
                  height: isActive2 == true ? 70 : 0,
                  duration: const Duration(milliseconds: 1000),
                  color: Colors.red,
                ),
            ],
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text("Soru 3"),
          content: Column(
            children: [
              const SizedBox(height: 6),
              QuestionTextCard(question: aliskanlikListesi[2].aliskanlikAdi),
              const SizedBox(height: 10),
              buildSingleCheckbox(aliskanlikListesi[2]),
              const SizedBox(height: 10),
              if (isActive3)
                AnimatedContainer(
                  height: isActive3 == true ? 70 : 0,
                  duration: const Duration(milliseconds: 1000),
                  child: TextFormField(
                    controller: soru3,
                    decoration: const InputDecoration(
                      labelText: "Miktar",
                      hintText: "Miktari Yaziniz",
                    ),
                  ),
                )
              else
                AnimatedContainer(
                  height: isActive3 == true ? 70 : 0,
                  duration: const Duration(milliseconds: 1000),
                  color: Colors.red,
                ),
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
              QuestionTextCard(question: aliskanlikListesi[3].aliskanlikAdi),
              const SizedBox(height: 10),
              buildSingleCheckbox(aliskanlikListesi[3]),
              const SizedBox(height: 10),
              if (isActive4)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  height: isActive4 == true ? 70 : 0,
                  child: TextFormField(
                    controller: soru4,
                    decoration: const InputDecoration(
                      labelText: "Miktar",
                      hintText: "Miktari Yaziniz",
                    ),
                  ),
                )
              else
                AnimatedContainer(
                  height: isActive4 == true ? 70 : 0,
                  duration: const Duration(milliseconds: 1000),
                  color: Colors.red,
                ),
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
              QuestionTextCard(question: aliskanlikListesi[4].aliskanlikAdi),
              const SizedBox(height: 10),
              buildSingleCheckbox(aliskanlikListesi[4]),
              const SizedBox(height: 10),
              if (isActive5)
                AnimatedContainer(
                  height: isActive5 == true ? 70 : 0,
                  duration: const Duration(milliseconds: 1000),
                  child: TextFormField(
                    controller: soru5,
                    decoration: const InputDecoration(
                      labelText: "Diger",
                      hintText: "Diger Aliskanliklar",
                    ),
                  ),
                )
              else
                AnimatedContainer(
                  height: isActive5 == true ? 70 : 0,
                  duration: const Duration(milliseconds: 1000),
                  color: Colors.red,
                ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 5,
          title: const Text("comlate"),
          content: Container(
            color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Bilgiler Kaydedilecek Lutfen BEKLEYIN"),
                Text(soru1.value.text),
                Text(soru2.value.text),
                Text(soru3.value.text),
                Text(soru4.value.text),
                Text(soru5.value.text),
              ],
            ),
          ),
        ),
      ];
  Widget buildSingleCheckbox(Aliskanlik model) => buildCheckbox(
      model: model,
      onClicked2: () {
        setState(() {
          final newValue2 = !model.hayir;
          model.hayir = newValue2;
          model.evet = false;
          switch (model.id) {
            case 1:
              isActive1 = false;
              soru1.clear();
              break;
            case 2:
              isActive2 = false;
              soru2.clear();
              break;
            case 3:
              isActive3 = false;
              soru3.clear();
              break;
            case 4:
              isActive4 = false;
              soru4.clear();
              break;
            case 5:
              isActive5 = false;
              soru5.clear();
              break;
            default:
          }
        });
      },
      onClicked: () {
        setState(() {
          final newValue = !model.evet;
          model.evet = newValue;
          model.hayir = false;
          switch (model.id) {
            case 1:
              isActive1 = true;
              break;
            case 2:
              isActive2 = true;
              break;
            case 3:
              isActive3 = true;
              break;
            case 4:
              isActive4 = true;
              break;
            case 5:
              isActive5 = true;
              break;
            default:
          }
        });
      });

  Widget buildCheckbox({
    required Aliskanlik model,
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
                model.aliskanlikAdi,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Hayir"),
                  Checkbox(
                    activeColor: kMyPrimaryColor,
                    value: model.hayir,
                    onChanged: (value) => onClicked2(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Evet"),
                  Checkbox(
                    activeColor: kMyPrimaryColor,
                    value: model.evet,
                    onChanged: (value) => onClicked(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
