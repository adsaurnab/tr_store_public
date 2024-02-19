import 'dart:convert';

import 'package:get/get.dart';

import '../../core/constants/constants.dart';
import '../../data/database/product_db.dart';
import '../../data/model/product_model.dart';
import '../../data/model/response_model/product_response_model.dart';
import '../../data/services/network_service.dart';
import '../../network/api_client.dart';
import '../../network/api_endpoints.dart';
import '../../routes/app_pages.dart';

class HomeController extends GetxController {
  final RxList<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5',
  ].obs;

  final RxList<ProductModel> productList = <ProductModel>[].obs;
  bool initialAppLoad = false;
  RxBool appIsLoading = true.obs;

  @override
  void onInit() {
    if (!Get.find<NetworkStatusService>().isConnected.value) {
      fetchOfflineProductData();
      Get.find<NetworkStatusService>().isConnected.listen((value) {
        if (value && !initialAppLoad) {
          fetchProducts();
        }
      });
    } else {
      fetchProducts();
    }
    super.onInit();
  }

  cartPressed() {
    Get.toNamed(Routes.SHOPPING_CART);
  }

  fetchOfflineProductData() async {
    productList.clear();
    var allProductData = await ProductDb.instance.allProductData();
    productList.addAll(allProductData);
    appIsLoading.value = false;
  }

  fetchProducts() async {
    productList.clear();
    ApiClient().getAPI(ApiEndPoints.postUrl).then((value) async {
      if (value != null) {
        logger.i("fetchProducts value: ${value.data.length}");
        for (var data in value.data) {
          var response = productResponseModelFromJson(jsonEncode(data));
          var productData = ProductModel(
            id: response.id,
            title: response.title ?? "",
            price: (response.userId ?? "").toString(),
            imageUrl: response.image ?? "",
            thumbnail: response.thumbnail ?? "",
          );
          productList.add(productData);
          ProductDb.instance.insertProductData(productData);
        }
        productList.refresh();
        logger.i("productList length: ${productList.length}");
        var allProductData = await ProductDb.instance.allProductData();
        logger.i("allProductData length: ${allProductData.length}");
        initialAppLoad = true;
        appIsLoading.value = false;
      }
    });
  }
}
