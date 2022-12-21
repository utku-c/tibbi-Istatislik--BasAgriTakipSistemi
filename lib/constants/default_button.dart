import 'package:flutter/material.dart';
import 'all_border_radius.dart';
import 'constant.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kMyPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
            // side: const BorderSide(
            //   color: kMyPrimaryBlack,
            //   width: 3.0,
            // ),
          ),
        ),
        onPressed: press,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            color: kMyPrimaryTextColor,
            letterSpacing: 2,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
