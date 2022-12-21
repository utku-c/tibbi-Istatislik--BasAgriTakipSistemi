import 'package:bas_agrisi_takip_sistemi/screens/home/my_home_page.dart';
import 'package:flutter/material.dart';

import '../../constants/constant.dart';
import '../../constants/custom_suffix_icon.dart';
import '../../constants/default_button.dart';
import '../../constants/no_account_text.dart';
import '../../constants/social_card.dart';
import 'form_error.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static String routeName = "/sign_in";
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const Text(
                    "Tekrar Hosgeldiniz",
                    style: TextStyle(
                      color: kMyPrimaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "E-posta ve sifre ile giris yap yada\nSosyal medya aracları ile giris yap",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kMyPrimaryTextColor,
                      fontSize: kMyFontSizeNormal,
                    ),
                  ),
                  // SizedBox(height: SizeConfig.screenHeight * 0.04),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  const SignForm(),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 10),
                  const NoAccountText()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _fromKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      child: Column(
        children: [
          newMethodEmailFromField(),
          const SizedBox(height: 30),
          newMethodPasswordFromField(),
          const SizedBox(height: 30),
          Row(
            children: [
              Checkbox(
                  activeColor: kMyPrimaryColor,
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  }),
              const Text("Remember Me"),
              const Spacer(),
              GestureDetector(
                // onTap: (() => Navigator.pushNamed(
                //       context,
                //       ForgotPasswordScreen.routeName,
                //     )),
                child: const Text(
                  "Forget Password",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          FormError(errors: errors),
          const SizedBox(height: 20),
          DefaultButton(
            text: "Continue",
            press: () {
              Navigator.pushNamed(context, MyHomePage.routeName);
              /////
              ///
              ///
              /// Burası düzenlenecek
              ///
              ///
              ///
              // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              // if (_fromKey.currentState != null &&
              //     _fromKey.currentState!.validate()) {
              //   _fromKey.currentState!.save();
              //   Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              // }
            },
          )
        ],
      ),
    );
  }

  TextFormField newMethodPasswordFromField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      cursorColor: kMyPrimaryTextColor,
      style: const TextStyle(
        color: kMyPrimaryColor,
      ),
      onSaved: (newValue) => password = newValue,
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 6 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }

        return;
      },
      validator: (value) {
        if (value != null &&
            value.isEmpty &&
            !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value != null &&
            value.length < 6 &&
            !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }

        return null;
      },
      decoration: const InputDecoration(
        hintText: "Enter Your Password",
        labelText: "Password",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField newMethodEmailFromField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      cursorColor: kMyPrimaryTextColor,
      cursorWidth: 2,
      style: const TextStyle(
        color: kMyPrimaryColor,
      ),
      onSaved: (newValue) => email = newValue,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return;
      },
      validator: (value) {
        if (value != null &&
            value.isEmpty &&
            !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value ?? "") &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Enter Your Email",
        labelText: "Email",
        iconColor: Colors.white,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
