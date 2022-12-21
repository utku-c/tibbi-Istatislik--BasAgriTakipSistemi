import 'package:flutter/material.dart';
import '../../constants/social_card.dart';
import 'widgets/sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = "/sign_up";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt Ol")),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Register Account",
                    ),
                    const Text(
                      "Complete your details or continue\nwith social media",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const SignUpForm(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialCard(
                          icon: "assets/icons/google-icon.svg",
                          press: () {},
                        ),
                        SocialCard(
                          icon: "assets/icons/facebook-2.svg",
                          press: () {},
                        ),
                        SocialCard(
                          icon: "assets/icons/twitter.svg",
                          press: () {},
                        ),
                      ],
                    ),
                    const Text(
                      "By continuing your confirm that you agree\nwith Term and Condition",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
