import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'constant.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
      child: SvgPicture.asset(
        color: kMyPrimaryColor,
        svgIcon,
        height: 20,
      ),
    );
  }
}
