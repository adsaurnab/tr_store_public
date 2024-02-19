import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../constants/app_style.dart';
import '../constants/constants.dart';
import '../utils/app_helper.dart';
import 'app_button.dart';

Widget gapH(double heightH) {
  return SizedBox(
    height: heightH,
  );
}

Widget gapW(double widthW) {
  return SizedBox(
    width: widthW,
  );
}

Widget gapW8() {
  return const SizedBox(
    width: 8,
  );
}

Widget gapH8() {
  return const SizedBox(
    height: 8,
  );
}

Widget gapH16() {
  return const SizedBox(
    height: 16,
  );
}

Widget gapW16() {
  return const SizedBox(
    width: 16,
  );
}

Widget gapW12() {
  return const SizedBox(
    width: 12,
  );
}

Widget gapW24() {
  return const SizedBox(
    width: 24,
  );
}

Widget gapH12() {
  return const SizedBox(
    height: 12,
  );
}

Widget gapH24() {
  return const SizedBox(
    height: 24,
  );
}

Widget gapH48() {
  return const SizedBox(
    height: 38,
  );
}


showSimpleDialog(
  String title,
  String body,
  retryClick, {
  buttonText = "Try Again",
  secondButtonText = "Close",
  secondRetryClick,
  barrierDismissible = true,
  showSecondButton = false,
}) {
  if (Get.context == null) {
    return null;
  }
  return showDialog(
    context: Get.context!,
    barrierDismissible: barrierDismissible,
    builder: (context) => AlertDialog(
      actionsPadding: !showSecondButton
          ? const EdgeInsets.symmetric(vertical: 20, horizontal: 30)
          : const EdgeInsets.only(bottom: 20),
      title: Text(
        title,
        style: headerTextStyle(),
      ),
      content: Text(
        body,
        style: normalTextStyle(),
      ),
      actions: <Widget>[
        showSecondButton
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: AppButton(
                      needVerticalPadding: false,
                      text: buttonText,
                      onPressed: () {
                        Navigator.pop(context);
                        if (buttonText != "Ok") {
                          try {
                            retryClick();
                            showLoader();
                          } catch (e) {
                            hideLoader();
                          }
                        }
                      },
                    ),
                  ),
                  gapW8(),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: AppButton(
                      needVerticalPadding: false,
                      text: secondButtonText,
                      onPressed: () {
                        Navigator.pop(context);
                        secondRetryClick();
                      },
                    ),
                  )
                ],
              )
            : AppButton(
                text: buttonText,
                onPressed: () {
                  Navigator.pop(context);
                  if (buttonText != "Ok") {
                    try {
                      retryClick();
                      showLoader();
                    } catch (e) {
                      hideLoader();
                    }
                  }
                },
              ),
      ],
    ),
  );
}

showSimpleToast(
  String? message, {
  String? title,
  bool isShort = false,
  bool isSuccess = false,
  bool isInfo = false,
  bool isError = true,
}) {
  Get.snackbar(
    title ??
        (isSuccess
            ? "Success"
            : isInfo
                ? "Info"
                : "Error"),
    message ?? "",
    icon: Icon(
      (isSuccess
          ? Icons.check_circle
          : isInfo
              ? Icons.info
              : Icons.error),
      color: AppColors.white,
    ),
    shouldIconPulse: true,
    barBlur: 20,
    overlayBlur: 1,
    isDismissible: true,
    snackPosition: SnackPosition.TOP,
    backgroundColor: (isSuccess
        ? AppColors.successColor.withOpacity(.8)
        : isInfo
            ? AppColors.infoColor.withOpacity(.8)
            : AppColors.errorColor.withOpacity(.8)),
    margin: EdgeInsets.only(
      top: mainPaddingH,
      left: mainPaddingW,
      right: mainPaddingW,
    ),
    colorText: AppColors.white,
    duration: const Duration(seconds: 3),
  );
}

SnackbarController getSnackBar(
    {title = "Title",
    message = " Some message",
    int waitingTime = 2,
    int animationDuration = 500,
    snackPosition = SnackPosition.TOP,
    Color backgroundColor = AppColors.primaryColor,
    double backgroundColorOpacity = .7,
    colorText = AppColors.white}) {
  return Get.snackbar(title, message,
      snackPosition: snackPosition,
      duration: Duration(seconds: waitingTime),
      animationDuration: Duration(milliseconds: animationDuration),
      backgroundColor: backgroundColor.withOpacity(backgroundColorOpacity),
      colorText: colorText);
}
