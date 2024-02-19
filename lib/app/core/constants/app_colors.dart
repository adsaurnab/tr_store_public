import 'package:flutter/material.dart';

class AppColors {
  static const int _primaryColorValue =
      0xFF7A5AF8;

  static const MaterialColor colorPrimarySwatch = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFEAE7FF),
      100: Color(0xFFC5BFFF),
      200: Color(0xFFA096FF),
      300: Color(0xFF7F71FF),
      400: Color(0xFF5946FF),
      500: Color(_primaryColorValue),
      600: Color(0xFF2F1DE3),
      700: Color(0xFF2A19CE),
      800: Color(0xFF2313BB),
      900: Color(0xFF1B0C9E),
    },
  );

  static const primaryColor = Color(0xFF7A5AF8);
  static const primaryColorDark = Color(0xFF6D4BFC);
  static const secondaryColor = Color(0xFF5ACDFF);
  static const appBackground = Color(0xFFF7FAFC);

  static const widgetBackground = Color(0xFFECECEC);
  static const gradientPrimaryColor = Color(0xFF3801bf);
  static const gradientSecondaryColor = Color(0xFFbd62a8);
  static const textLiteColor = Color(0xff505050);
  static const primaryColorLite = Color(0xffD9D6FE);

  static const backgroundColor = Color(0xFFE8E8E8);
  static const liteGreen = Color(0xFF56C674);
  static const liteGrayStepLine = Color(0xFF8FAABB);

  static const cardBackgroundColor = Color(0xffC3E1FB);
  static const cardBackgroundLite = Color(0xff2E74FC);

  static const transparent = Color(0x00bd4efe);
  static const gistBackground = Color.fromARGB(255, 59, 49, 65);
  static const gistForeground = Colors.white;
  static const gistText = Colors.white;

  static const darkPurple = Color(0xFF12101F);
  static const purple = Color(0xFF5C3BFF);
  static const black = Color(0xFF000000);
  static const blackPure = Color(0xFF000000);
  static const white = Color(0xFFF8F8F8);
  static const whitePure = Color(0xFFFFFFFF);
  static const grey = Color(0xFF52596E);
  static const statusGrey = Color(0xFF9A9FA4);
  static const liteGrey = Color(0xFFD9D9D9);
  static const liteGreyStepLine = Color(0xFF8FAABB);
  static const liteStepLine = Color(0xFFE2F0FD);
  static const inputColor = Color(0x8052596E); //alpha 50%
  static const wrong = Color(0xFFC20707);
  static const green = Color(0xFF34A853);
  static const red = Color(0xFFFF1F00);
  static const darkRed = Color(0xFF4A154B);
  static const orangeLite = Color(0xFFFE914E);

  static const dotColor = Color(0xFF000000);

  static const headerTextColor = Color(0xFF172B4D);
  static const appBarTextColor = Color(0xFF000000);
  static const underlineColor = Color(0xFFCCCCCC);
  static const textColorBlue = Color(0xFF2E38B6);
  static const fieldColor = Color(0xFF846AE3);
  static const questionListBackgroundColor = Color(0xFFF2F7F6);

  static const listBackgroundColor = Color(0xFFF7F7F7);
  static const listStrokeColor = Color(0xFFDDDDDD);


  static const gradientLeftColor = Color(0xB8240DFF);
  static const gradientRightColor = Color(0xFF6B4BDA);

  static const shimmerBaseColor = Color(0xFFD9D9D9);
  static const shimmerHighlightColor = Color(0xFFF6F6F6);

  static const baseGradient = LinearGradient(
    colors: [
      gradientLeftColor,
      gradientRightColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const infoColor = Color(0xFF33b5e5);
  static const successColor = Color(0xFF00C851);
  static const errorColor = Color(0xFFff4444);

  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF3A3A3A);

  static const textColor = Color(0xffccd6f6);
  static const neonColor = Color(0xff76eeda);
  static const textLight = Color(0xff8892b0);
  static const cardColor = Color(0xff112240);
}
