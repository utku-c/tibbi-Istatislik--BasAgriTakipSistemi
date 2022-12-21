import 'package:flutter/material.dart';

import '../../../constants/constant.dart';
import '../../../constants/custom_suffix_icon.dart';
import '../../../constants/default_button.dart';

import '../../sign_in/form_error.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _fromKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conformPassword;

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
          emailFormField(),
          const SizedBox(height: 20),
          passwordFromField(),
          const SizedBox(height: 20),
          conformPasswordFromField(),
          const SizedBox(height: 20),
          FormError(errors: errors),
          const SizedBox(height: 20),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_fromKey.currentState != null &&
                  _fromKey.currentState!.validate()) {
                // go to complate profile page
                //Navigator.pushNamed(context, ComplateProfileScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField conformPasswordFromField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      onSaved: (newValue) => conformPassword = newValue,
      obscureText: true,
      onChanged: (value) {
        if (password == conformPassword) {
          removeError(error: kMatchPassError);
        }

        return;
      },
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: kMatchPassError);
          return "";
        }

        return null;
      },
      decoration: const InputDecoration(
        hintText: "Re - enter Your password",
        labelText: "Confirm Password",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField passwordFromField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => password = newValue,
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 6) {
          removeError(error: kShortPassError);
        }
        password = value;
        return;
      },
      validator: (value) {
        if (value != null && value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value != null && value.length < 6) {
          addError(error: kShortPassError);
          return "";
        }

        return null;
      },
      decoration: const InputDecoration(
        hintText: "Enter your password",
        labelText: "Password",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => email = newValue,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value != null && value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value ?? "")) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Enter Your Email",
        labelText: "Email",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
