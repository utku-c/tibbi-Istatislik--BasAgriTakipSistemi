import 'package:flutter/material.dart';

import '../screens/sign_up/sign_up_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: (() => Navigator.pushNamed(context, SignUpPage.routeName)),
          child: const Text(
            "Sign Up ",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
