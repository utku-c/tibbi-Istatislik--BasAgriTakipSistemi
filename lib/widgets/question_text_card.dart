import 'package:bas_agrisi_takip_sistemi/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuestionTextCard extends StatelessWidget {
  const QuestionTextCard({
    Key? key,
    required this.question,
  }) : super(key: key);
  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kMyPrimaryTextColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              "assets/icons/question.svg",
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 3),
          Expanded(
            flex: 7,
            child: Text(
              question,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
