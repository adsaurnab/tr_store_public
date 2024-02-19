import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/app/core/widgets/shimmer/shimmer_widgets.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_style.dart';
import '../../../core/constants/constants.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../core/widgets/cached_network_image.dart';
import 'product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        backgroundColor: AppColors.whitePure,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [],
      ),
      body: Container(
        color: AppColors.whitePure,
        child: SingleChildScrollView(
          child: Obx(() {
            return !controller.initialAppLoad.value ||
                    controller.productData.value.id == null
                ? ShimmerWidgets().productDetailsShimmer()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomCachedNetworkImage(
                        imageUrl: controller.productData.value.imageUrl ?? "",
                        height: 200.0,
                        width: double.infinity,
                      ),
                      Container(
                        height: 100.0,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildProductImage(
                                controller.productData.value.imageUrl ?? ""),
                            // Add more images as needed
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.productData.value.title ?? "",
                          style: headerTextStyle(
                            fontSize: fontSize18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.productData.value.content ?? "",
                          style: normalTextStyle(
                            fontSize: fontSize16,
                          ),
                        ),
                      ),
                      gapH(80),
                    ],
                  );
          }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: cardBoxShadow(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return Flexible(
                child: Text(
                  '\$ ${controller.productData.value.price ?? ""}',
                  style: headerTextStyle(fontSize: fontSize18),
                ),
              );
            }),
            Obx(() {
              return SizedBox(
                height: 45,
                child: AppButton(
                  text: controller.productInCart.value
                      ? "View Cart"
                      : 'Add to Cart',
                  needVerticalPadding: false,
                  onPressed: controller.productInCart.value
                      ? controller.viewCart
                      : controller.handleAddToCart,
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: CustomCachedNetworkImage(
        imageUrl: imageUrl,
        width: 60.0,
        height: 60.0,
        isBoxFitContain: true,
      ),
    );
  }
}
