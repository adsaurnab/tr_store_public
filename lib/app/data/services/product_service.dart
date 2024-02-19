import 'dart:async';

import 'package:get/get.dart';

import '../database/shopping_cart_db.dart';
import '../model/shopping_cart_model.dart';

class ProductService extends GetxService {
  final RxList<ShoppingCartModel> _cartData = <ShoppingCartModel>[].obs;

  final _cartStreamController =
      StreamController<List<ShoppingCartModel>>.broadcast();

  Stream<List<ShoppingCartModel>> get cartStream =>
      _cartStreamController.stream;

  @override
  void onInit() {
    getAllCartItems();
    super.onInit();
  }

  getAllCartItems() async {
    var response = await ShoppingCartDb.instance.allShoppingCartData();
    for (var element in response) {
      addCartData(element);
    }
  }

  addCartData(ShoppingCartModel shoppingCartData) {
    _cartData.add(shoppingCartData);
    _cartData.refresh();
    _cartStreamController.add(_cartData);
  }

  removeCartData(ShoppingCartModel shoppingCartData) {
    _cartData.remove(shoppingCartData);
    _cartData.refresh();
    _cartStreamController.add(_cartData);
  }

  removeAllCartData() {
    _cartData.clear();
    _cartStreamController.add(_cartData);
  }

  @override
  void onClose() {
    _cartStreamController.close();
    super.onClose();
  }
}
