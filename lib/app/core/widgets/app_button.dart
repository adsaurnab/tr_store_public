import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_style.dart';
import '../constants/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryColor,
    this.fontSize = fontSize16,
    this.fontWeight = FontWeight.w700,
    this.borderRadius = 5.0,
    this.gapSize = 5.0,
    this.borderWidth = 1.5,
    this.assetImageWidth = 50.0,
    this.iconSize = 50.0,
    this.textLineHeight = 1.1,
    this.maxTextLines = 1,
    this.textLetterSpacing = .6,
    this.textColor = AppColors.white,
    this.iconColor = AppColors.white,
    this.isTextPrimaryColor = false,
    this.isTextDefaultGradientColor = false,
    this.isFontNormal = false,
    this.isTextNormalLineHeight = false,
    this.isTextNormalLineSpacing = false,
    this.isEmptyBackGroundWithPrimaryColor = false,
    this.needVerticalPadding = true,
    this.needGradient = false,
    this.needAssetImage = false,
    this.assetImage = "",
    this.needIcon = false,
    this.textAlign = TextAlign.center,
    this.icon,
  });

  final IconData? icon;
  final String text, assetImage;
  final double textLetterSpacing,
      textLineHeight,
      fontSize,
      borderRadius,
      borderWidth,
      assetImageWidth,
      iconSize,
      gapSize;
  final bool isTextNormalLineSpacing,
      isTextNormalLineHeight,
      isFontNormal,
      isTextDefaultGradientColor,
      isTextPrimaryColor,
      isEmptyBackGroundWithPrimaryColor,
      needVerticalPadding,
      needGradient,
      needAssetImage,
      needIcon;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final Color textColor, backgroundColor, iconColor;
  final void Function()? onPressed;
  final int maxTextLines;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(needGradient ? 0.0 : 1.0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          onPressed == null
              ? isEmptyBackGroundWithPrimaryColor
                  ? AppColors.white
                  : AppColors.primaryColor.withOpacity(0.6)
              : needGradient
                  ? Colors.transparent
                  : isEmptyBackGroundWithPrimaryColor
                      ? AppColors.white
                      : backgroundColor,
        ),
        side: isEmptyBackGroundWithPrimaryColor
            ? MaterialStateProperty.all<BorderSide>(
                BorderSide(width: borderWidth, color: AppColors.primaryColor),
              )
            : null,
      ),
      onPressed: onPressed,
      child: Container(
        padding: needVerticalPadding
            ? const EdgeInsets.symmetric(vertical: 15)
            : null,
        child: Text(
          text,
          textAlign: textAlign,
          style: headerTextStyle(
            color: isTextPrimaryColor || isEmptyBackGroundWithPrimaryColor
                ? AppColors.primaryColor
                : textColor,
            fontSize: fontSize,
            lineHeight: textLineHeight,
            letterSpacing: textLetterSpacing,
            isNormalLineHeight: isTextNormalLineHeight,
            isNormalLineSpacing: isTextNormalLineSpacing,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
