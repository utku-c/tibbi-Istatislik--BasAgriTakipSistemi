import 'package:flutter/material.dart';

import '../constants/constant.dart';

class DividerWithTextWidget extends StatelessWidget {
  final String text;
  const DividerWithTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final line = Expanded(
        child: Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: const Divider(height: 20, thickness: 3),
    ));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        line,
        Text(
          text,
          style: const TextStyle(
            fontSize: 30,
            color: kMyPrimaryColor,
          ),
        ),
        line,
      ],
    );
  }
}
