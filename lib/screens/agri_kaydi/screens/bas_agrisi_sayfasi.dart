// import 'package:flutter/material.dart';

// import '../../../constants/constant.dart';
// import '../../../constants/default_button.dart';
// import '../model/bas_agrisi_sorular_model.dart';

// class BasAgrisiSayfasi extends StatefulWidget {
//   const BasAgrisiSayfasi({Key? key}) : super(key: key);
//   static String routeName = "/bas_agrisi_ekle";

//   @override
//   State<BasAgrisiSayfasi> createState() => _BasAgrisiSayfasiState();
// }

// class _BasAgrisiSayfasiState extends State<BasAgrisiSayfasi> {
//   final String _kaydet = "Kaydet";

//   // ! Verileri tutmak için değişken Oluşturduk
//   final List<BasAgriSoruModel> _soru = [
//     BasAgriSoruModel(soru: "", isOkey: false),
//     BasAgriSoruModel(soru: "", isOkey: false),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {
//         Navigator.pop(context, false);
//         return Future.value(false);
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Baş Ağrısı",
//             style: TextStyle(fontSize: 22),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               SizedBox(
//                 height: 300,
//                 child: ListView.builder(
//                   itemCount: 6,
//                   //itemCount: _soru.length,
//                   itemBuilder: (context, index) {
//                     return buildSingleCheckbox(_soru[index]);
//                   },
//                 ),
//               ),
//               DefaultButton(
//                 text: _kaydet,
//                 press: () {
//                   Navigator.pop<List<BasAgriSoruModel>>(
//                     context,
//                     _soru,
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildSingleCheckbox(BasAgriSoruModel model) => buildCheckbox(
//       model: model,
//       onClicked: () {
//         setState(() {
//           final newValue = !model.isOkey;
//           model.isOkey = newValue;
//         });
//       });

//   Widget buildCheckbox({
//     required BasAgriSoruModel model,
//     required VoidCallback onClicked,
//   }) =>
//       Padding(
//         padding: const EdgeInsets.only(top: 12),
//         child: Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: kMyPrimaryTextColor.withOpacity(0.5),
//           ),
//           height: 160,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 model.soru,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const Text("Hayir"),
//                   Checkbox(
//                     activeColor: kMyPrimaryColor,
//                     value: model.isOkey,
//                     onChanged: (value) => onClicked(),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
// }
