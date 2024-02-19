import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/app/core/widgets/shimmer/shimmer_widgets.dart';

import '../../core/constants/app_components.dart';
import '../../core/utils/app_helper.dart';
import '../../core/widgets/app_scroll_behavior.dart';
import '../../core/widgets/product/product_widget.dart';
import '../../data/model/product_model.dart';
import '../../data/services/product_service.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    statusBarDefaultSettings();
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: AppScrollBehavior(),
          child: SingleChildScrollView(
            child: Container(
              color: AppColors.whitePure,
              child: Column(
                children: [
                  headerWidget("Discover Products",
                      iconTap: controller.cartPressed),
                  Obx(() {
                    return horizontalCategoryScrollWidget(
                        controller.categories);
                  }),
                  Obx(() {
                    return productListWidget(
                        products: controller.productList.toList(),
                        showShimmer: controller.appIsLoading.value);
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  headerWidget(String title,
      {fontColor,
      double fontSize = 18.0,
      Function()? iconTap,
      IconData? icon,
      iconColor,
      double iconSize = 30}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: headerTextStyle(
                fontSize: fontSize,
                color: fontColor,
              ),
            ),
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  icon ?? Icons.shopping_cart,
                  color: iconColor ?? AppColors.primaryColor,
                  size: iconSize,
                ),
                onPressed: iconTap,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: StreamBuilder(
                  stream: Get.find<ProductService>().cartStream,
                  builder: (context, snapshot) {
                    return Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.red.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "${snapshot.data?.length ?? 0}",
                        style: headerTextStyle(
                          isColorWhite: true,
                          fontSize: fontSize12,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  horizontalCategoryScrollWidget(List categories) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 40.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Material(
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () {
                    logger.i('Category clicked: ${categories[index]}');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: normalTextStyle(),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget productListWidget(
      {required List<ProductModel> products, bool showShimmer = false}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: showShimmer ? 6 : (products.length / 2).ceil(),
      itemBuilder: (context, index) {
        int startIndex = index * 2;
        int endIndex = startIndex + 1;
        if (endIndex >= products.length) {
          endIndex = products.length - 1;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: showShimmer
                  ? ShimmerWidgets().productDetailsShimmer()
                  : ProductWidget(product: products[startIndex]),
            ),
            gapH16(),
            Expanded(
              child: showShimmer
                  ? ShimmerWidgets().productDetailsShimmer()
                  : ProductWidget(product: products[endIndex]),
            ),
          ],
        );
      },
    );
  }
}

// class ProductListWidget extends StatelessWidget {
//   final List<ProductModel> products;
//
//   const ProductListWidget({super.key, required this.products});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: (products.length / 2).ceil(),
//       itemBuilder: (context, index) {
//         int startIndex = index * 2;
//         int endIndex = startIndex + 1;
//         if (endIndex >= products.length) {
//           endIndex = products.length - 1;
//         }
//
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ProductWidget(product: products[startIndex]),
//             ),
//             gapH16(),
//             Expanded(
//               child: ProductWidget(product: products[endIndex]),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
