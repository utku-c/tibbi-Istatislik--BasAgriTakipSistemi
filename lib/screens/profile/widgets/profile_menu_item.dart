import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/constant.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: kMyPrimaryTextColor,
        ),
        onPressed: null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 40,
            ),
            const SizedBox(width: 20),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.fuzzyBubbles(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: kMyPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
