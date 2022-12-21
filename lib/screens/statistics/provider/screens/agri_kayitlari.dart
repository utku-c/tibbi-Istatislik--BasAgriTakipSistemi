// import 'package:bas_agrisi_takip_sistemi/constants/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';

// import '../state/statistick_state.dart';
// import 'agri_kayit_detay.dart';

// class AgriKayitSayfasi extends StatelessWidget {
//   const AgriKayitSayfasi({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Ağrı Kayıtları"),
//       ),
//       body: Consumer<StatistickModel>(builder: (context, value, child) {
//         return SizedBox(
//           child: ListView.builder(
//             itemCount: value.tumKayit.length,
//             itemBuilder: ((context, index) {
//               var item = value.tumKayit[index];
//               String tarih =
//                   "${item.kayitTarihi.day}.${item.kayitTarihi.month}.${item.kayitTarihi.year}  -  ${item.kayitTarihi.hour}.${item.kayitTarihi.minute}";
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: ((context) =>
//                             AgriKAydiDetaySayfasi(model: item)),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     height: 120,
//                     decoration: BoxDecoration(
//                       color: kMyPrimaryTextColor,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ListTile(
//                             leading: SvgPicture.asset(
//                               "assets/icons/agri_kaydi_takvim_add.svg",
//                               width: 30,
//                             ),
//                             title: Text(
//                               tarih,
//                               style: const TextStyle(fontSize: 18),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ),
//         );
//       }),
//     );
//   }
// }
