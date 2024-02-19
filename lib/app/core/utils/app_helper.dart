import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

statusBarDefaultSettings() {
  return SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Status bar
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

hideLoader() {
  if (EasyLoading.isShow) {
    EasyLoading.dismiss();
  }
}

hideKeyboard() {
  FocusScopeNode currentFocus = FocusScope.of(Get.context!);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    currentFocus.focusedChild?.unfocus();
  }
}

showLoader({needToShow = true}) {
  if (needToShow) {
    if (!EasyLoading.isShow) {
      return EasyLoading.show(
        status: "Loading...",
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: kDebugMode ? true : false,
      );
    }
  }
}
