import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/app/core/widgets/cached_network_image.dart';
import 'package:tr_store/app/routes/app_pages.dart';

import '../../../data/model/product_model.dart';
import '../../constants/app_style.dart';
import '../app_widgets.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        boxShadow: cardBoxShadow(),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Get.toNamed(
              Routes.PRODUCT_DETAILS,
              arguments: product.id ?? "",
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: CustomCachedNetworkImage(
                  imageUrl: product.imageUrl ?? "",
                  height: 100.0,
                  width: double.infinity,
                ),
              ),
              gapH8(),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      product.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: headerTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                    gapH8(),
                    Text(
                      '\$${double.parse(product.price ?? "").toStringAsFixed(2)}',
                      style: normalTextStyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
