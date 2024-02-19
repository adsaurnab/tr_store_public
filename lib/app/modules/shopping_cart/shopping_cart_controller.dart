import 'dart:async';

import 'package:get/get.dart';

import '../../core/constants/app_components.dart';
import '../../data/database/shopping_cart_db.dart';
import '../../data/model/shopping_cart_model.dart';
import '../../data/services/product_service.dart';

class ShoppingCartController extends GetxController {
  late Stream<List<ShoppingCartModel>> cartStream;
  late StreamSubscription<List<ShoppingCartModel>> streamSubscription;

  @override
  void onInit() {
    cartStream = Get.find<ProductService>().cartStream;
    getAllCartItems();

    super.onInit();
  }

  getAllCartItems() async {
    await Get.find<ProductService>().removeAllCartData();
    var response = await ShoppingCartDb.instance.allShoppingCartData();
    for (var cartData in response) {
      Get.find<ProductService>().addCartData(cartData);
    }
  }

  deleteShoppingCartData(ShoppingCartModel cartData) {
    ShoppingCartDb.instance.deleteShoppingCartData((cartData.id ?? -1).toInt());
    Get.find<ProductService>().removeCartData(cartData);
  }

  updateShoppingData(
    ShoppingCartModel shoppingCartData,
    String totalAmount,
  ) async {
    shoppingCartData.totalAmount = totalAmount;
    shoppingCartData.updatedAt = DateTime.now().toString();
    await ShoppingCartDb.instance.updateShoppingCartData(shoppingCartData);

    Get.find<ProductService>().cartStream.forEach((shoppingList) {
      for (var element in shoppingList) {
        if ((element.id ?? -1).toInt() == shoppingCartData.id) {
          element = shoppingCartData;
          break;
        }
      }
    });
  }

  void handleCheckOut() {
    ShoppingCartDb.instance.deleteAllShoppingCartDataFromTable();
    showSimpleToast(
      "successfully bought your items",
      isSuccess: true,
    );
  }
}
