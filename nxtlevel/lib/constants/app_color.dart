import 'package:flutter/material.dart';

class AppColors {
  static const kPrimaryColor = Color(0xFF2645A5);
  static const kSecondaryColor = Color(0xFF2645A5);
  static const kItemColor = Color(0xFF2645A5);
  static const kLightGradient = Color(0x992CAAFF);
  static const kTextFieldColor = Color(0xF2F0EFFF);
  static const kLightGreyTextColor = Color(0xFFD0CFCF);
  static const kErrorColor = Color(0xFFEB4034);
  static const kGreyColor = Color(0xFF9E9E9E);
  static const kColorWhite = Color(0xFFFFFFFF);
  static const kBackgroundColor = Color(0xfff5f5f9);
  static const kBlack = Color(0xFF000000);
  static const kBlackLight = Color(0xAB000000);
  static const kTealColor = Color(0xff66e0da);
  static const kBlueColor = Color(0xff6a85e5);
  static const kOrangeColor = Color(0xfffd9a6f);
  static const kVoiletColor = Color(0xffc78ae5);

  static MaterialColor materialColorApp = const MaterialColor(
    0xFF2645A5,
    <int, Color>{
      50: Color(0xff8899ce),
      100: Color(0xff7d8fc9),
      200: Color(0xff677dc0),
      300: Color(0xff516ab7),
      400: Color(0xff3c58ae),
      500: Color(0xff2645a5), // The primary color
      600: Color(0xff223e94),
      700: Color(0xff1e3784),
      800: Color(0xff1b3073),
      900: Color(0xff172963),
    },
  );
}
