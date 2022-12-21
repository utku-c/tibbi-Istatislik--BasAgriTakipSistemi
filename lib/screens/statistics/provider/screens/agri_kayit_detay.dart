// import 'package:bas_agrisi_takip_sistemi/constants/constant.dart';
// import 'package:bas_agrisi_takip_sistemi/constants/default_button.dart';
// import 'package:bas_agrisi_takip_sistemi/screens/agri_kaydi/model/kayit_model.dart';
// import 'package:flutter/material.dart';

// class AgriKAydiDetaySayfasi extends StatelessWidget {
//   const AgriKAydiDetaySayfasi({
//     Key? key,
//     required this.model,
//   }) : super(key: key);
//   final KayitModel model;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Detaylar"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: kMyPrimaryTextColor,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Kullanılan İlaçlar",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 14),
//                       for (int i = 0; i < model.basAgriIlac.length; i++)
//                         if (model.basAgriIlac[i].faydalioldu == true)
//                           Text(model.basAgriIlac[i].ilacAdi),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: kMyPrimaryTextColor,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Baş Ağrı Belirtileri",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 14),
//                       for (int i = 0; i < model.basAgriBelirti.length; i++)
//                         if (model.basAgriBelirti[i].isOkey == true)
//                           Text(model.basAgriBelirti[i].soru),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: kMyPrimaryTextColor,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Başağrısını Tetikleyenler",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 14),
//                       for (int i = 0; i < model.basAgriTetikleyici.length; i++)
//                         if (model.basAgriTetikleyici[i].etki == true)
//                           Text(model.basAgriTetikleyici[i].tetikleyen),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: kMyPrimaryTextColor,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Not",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 14),
//                       Text(model.not.not)
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: kMyPrimaryTextColor,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Text(
//                           "Ağrı Derecesi ${model.derece.value.toString()}",
//                           style: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               DefaultButton(
//                   text: "Kapat",
//                   press: () {
//                     Navigator.pop(context);
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
