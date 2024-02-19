import 'dart:convert';

import 'package:get/get.dart';
import 'package:tr_store/app/data/services/product_service.dart';

import '../../../data/database/product_db.dart';
import '../../../data/database/shopping_cart_db.dart';
import '../../../data/model/product_model.dart';
import '../../../data/model/response_model/product_response_model.dart';
import '../../../data/model/shopping_cart_model.dart';
import '../../../data/services/network_service.dart';
import '../../../network/api_client.dart';
import '../../../network/api_endpoints.dart';
import '../../../routes/app_pages.dart';

class ProductDetailsController extends GetxController {
  final productId = "".obs;
  final productData = ProductModel().obs;
  final productInCart = false.obs;
  RxBool initialAppLoad = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      productId.value = Get.arguments.toString();

      if (!Get.find<NetworkStatusService>().isConnected.value) {
        fetchProductDetailsOffline();
        Get.find<NetworkStatusService>().isConnected.listen((value) {
          if (value && !initialAppLoad.value) {
            fetchProductDetails();
          }
        });
      } else {
        fetchProductDetails();
      }
    }
    super.onInit();
  }

  checkIfAddedToCart() async {
    var response = await ShoppingCartDb.instance
        .getShoppingCartDataByProductId((productData.value.id ?? -1).toInt());
    if (response != null) {
      productInCart.value = true;
    }
  }

  fetchProductDetailsOffline() async {
    productData.value = ProductModel();
    var response =
        await ProductDb.instance.getProductData(int.parse(productId.value));
    if (response != null) {
      productData.value = response;
      checkIfAddedToCart();
    }
  }

  fetchProductDetails() async {
    ApiClient()
        .getAPI(ApiEndPoints.singlePostUrl(productId.value))
        .then((value) async {
      if (value != null) {
        var response = productResponseModelFromJson(jsonEncode(value.data));
        productData.value = ProductModel(
          id: response.id,
          title: response.title ?? "",
          content: response.content ?? "",
          price: (response.userId ?? "").toString(),
          imageUrl: response.image ?? "",
          thumbnail: response.thumbnail ?? "",
        );
        initialAppLoad.value = true;
        checkIfAddedToCart();
      }
    });
  }

  void viewCart() {
    Get.toNamed(Routes.SHOPPING_CART);
  }

  Future<void> handleAddToCart() async {
    var shoppingCartData = ShoppingCartModel(
      userId: 1,
      productId: productData.value.id ?? -1,
      totalProducts: "1",
      totalAmount: "1",
      title: productData.value.title ?? "",
      price: productData.value.price ?? "",
      thumbnail: productData.value.thumbnail ?? "",
      timestamp: DateTime.now().microsecondsSinceEpoch,
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    );
    Get.find<ProductService>().addCartData(shoppingCartData);
    await ShoppingCartDb.instance
        .insertShoppingCartData(shoppingCartData)
        .then((value) {
      checkIfAddedToCart();
    });
  }
}
