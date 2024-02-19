import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'constants.dart';

TextStyle headerTextStyle({
  color = AppColors.black,
  double fontSize = fontSize16,
  fontWeight = FontWeight.w700,
  lineHeight = 1.1,
  letterSpacing = 0.0,
  isColorWhite = false,
  isPrimaryColor = false,
  isDefaultGradientColor = false,
  isFontNormal = false,
  isNormalLineHeight = false,
  isTextDecUnderline = false,
  isNormalLineSpacing = false,
}) {
  return GoogleFonts.montserrat(
    fontSize: fontSize,
    decoration: isTextDecUnderline ? TextDecoration.underline : null,
    color: isPrimaryColor
        ? AppColors.primaryColor
        : isColorWhite
            ? AppColors.white
            : color,
    fontWeight: isFontNormal ? FontWeight.normal : fontWeight,
    height: isNormalLineHeight ? 1 : lineHeight,
    letterSpacing: isNormalLineSpacing ? 0 : letterSpacing,
  );
}

TextStyle normalTextStyle({
  color = AppColors.black,
  double fontSize = fontSize14,
  fontWeight = FontWeight.normal,
  lineHeight = 1.1,
  letterSpacing = 0.0,
  isColorWhite = false,
  isPrimaryColor = false,
  isDefaultGradientColor = false,
  isFontNormal = false,
  isNormalLineHeight = false,
  isTextDecUnderline = false,
  isNormalLineSpacing = false,
  isFontWeight500 = false,
}) {
  return GoogleFonts.montserrat(
    fontSize: fontSize,
    decoration: isTextDecUnderline ? TextDecoration.underline : null,
    color: isPrimaryColor
        ? AppColors.primaryColor
        : isColorWhite
            ? AppColors.white
            : color,
    fontWeight: isFontNormal
        ? FontWeight.normal
        : isFontWeight500
            ? FontWeight.w500
            : fontWeight,
    height: isNormalLineHeight ? 1.0 : lineHeight,
    letterSpacing: isNormalLineSpacing ? 0.0 : letterSpacing,
  );
}

final hintStyle = GoogleFonts.inter(
  fontSize: 14,
  color: AppColors.inputColor,
  fontWeight: FontWeight.w500,
);

BoxDecoration appCardDecoration() {
  return BoxDecoration(
      borderRadius: borderRadiusCircular(), boxShadow: [boxShadow()]);
}

borderRadiusCircular({radius = 12}) {
  return BorderRadius.circular(radius);
}

boxShadow({
  blurRadius = 1.0,
  spreadRadius = 1.0,
  color = AppColors.primaryColor,
  offset = Offset.zero,
}) {
  return BoxShadow(
    blurRadius: 1.0,
    spreadRadius: 1.0,
    color: color,
    offset: offset,
  );
}

List<BoxShadow> cardBoxShadow(
    {Color? color, double blurRadius = 5, double spreadRadius = 2}) {
  return [
    BoxShadow(
      color: color ?? AppColors.grey.withOpacity(.1),
      spreadRadius: spreadRadius,
      blurRadius: blurRadius,
    )
  ];
}
