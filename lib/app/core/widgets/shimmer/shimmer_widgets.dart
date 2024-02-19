import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/asset_constants.dart';
import '../app_widgets.dart';
import 'shimmer_base.dart';

class ShimmerWidgets {
  Widget productDetailsShimmer() {
    return ShimmerBase(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                logo,
                height: 95,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            gapH(6),
            Container(
              height: 10,
              color: Colors.white,
              width: Get.width * .4,
            ),
            gapH8(),
            Container(
              height: 40,
              color: Colors.white,
              width: Get.width * .8,
            ),
            gapH12(),
            Container(
              height: 12,
              color: Colors.white,
              width: Get.width * .6,
            ),
            gapH12(),
            Container(
              height: 20,
              color: Colors.white,
              width: Get.width * .8,
            ),
            gapH24(),
            Container(
              width: Get.width * .3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.primaryColor,
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Apply",
                  ),
                ),
              ),
            ),
            gapH24(),
          ],
        ),
      ),
    );
  }
}
