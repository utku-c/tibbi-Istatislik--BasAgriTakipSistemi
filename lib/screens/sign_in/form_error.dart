import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => formErrorText(
          errorMessage: errors[index],
        ),
      ),
    );
  }

  Row formErrorText({required String errorMessage}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: 18,
          width: 18,
        ),
        const SizedBox(width: 18),
        Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
