import 'package:flutter/material.dart';
import 'size_config.dart';

/// YENİ
const kMyBackgroundColor = Color(0xFF8288C3);
const kMyPrimaryColor = Color(0xFF242961);
const kMyPrimaryTextColor = Color(0xFFD0BED4);
const kMyPrimaryBlack = Color(0xFF0B0B11);

const double kMyFontSizelow = 18;
const double kMyFontSizeNormal = 22;
const double kMyFontSizeHigh = 28;

/* */
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);

const kAnimationDuration = Duration(milliseconds: 200);
const kMyAnimationDuration = Duration(milliseconds: 600);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final headingStyle = TextStyle(
  fontSize: getProportionateScreenHeight(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

/// kullanılmıyor
final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: getProportionateScreenHeight(15),
  ),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: kMyPrimaryColor,
    ),
  );
}
