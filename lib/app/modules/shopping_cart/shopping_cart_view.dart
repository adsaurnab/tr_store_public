import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_components.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/cached_network_image.dart';
import '../../data/model/shopping_cart_model.dart';
import 'shopping_cart_controller.dart';

class ShoppingCartView extends GetView<ShoppingCartController> {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            StreamBuilder<List<ShoppingCartModel>>(
              stream: controller.cartStream,
              builder: (context, snapshot) {
                return ListView.separated(
                  itemCount: snapshot.data?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = snapshot.data?[index] ?? ShoppingCartModel();
                    return ProductItemWidget(
                      shoppingData: data,
                      controller: controller,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return gapH8();
                  },
                );
              },
            ),
            gapH(60),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 45,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: AppButton(
          text: 'Checkout',
          needVerticalPadding: false,
          onPressed: () {
            controller.handleCheckOut();
          },
        ),
      ),
    );
  }
}

class ProductItemWidget extends StatefulWidget {
  final ShoppingCartModel shoppingData;
  final controller;
  final bool isInStock;

  const ProductItemWidget({
    super.key,
    required this.shoppingData,
    required this.controller,
    this.isInStock = true,
  });

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primaryColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CustomCachedNetworkImage(
              imageUrl: widget.shoppingData.thumbnail ?? "",
              width: 100.0,
              height: 100.0,
              isBoxFitContain: true,
            ),
          ),
          gapW8(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.shoppingData.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapH8(),
                Text(
                  widget.isInStock ? 'In Stock' : 'Out of Stock',
                  style: TextStyle(
                    color: widget.isInStock ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                widget.isInStock
                    ? QuantitySelector(
                        initialQuantity:
                            int.parse(widget.shoppingData.totalAmount ?? ""),
                        onChanged: (value) {
                          setState(() {
                            widget.shoppingData.totalAmount = value.toString();
                            widget.controller.updateShoppingData(
                                widget.shoppingData, value.toString());
                          });
                        },
                      )
                    : const SizedBox.shrink(),
                InkWell(
                  onTap: () {
                    widget.controller
                        .deleteShoppingCartData(widget.shoppingData);
                  },
                  child: const Text(
                    'Remove',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          gapW8(),
          widget.isInStock
              ? SizedBox(
                  width: 50,
                  child: Text(
                    '\$${int.parse(widget.shoppingData.price ?? "") * int.parse(widget.shoppingData.totalAmount ?? "")} ',
                    style: headerTextStyle(),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  final int initialQuantity;
  final ValueChanged<int>? onChanged;

  const QuantitySelector({
    super.key,
    this.initialQuantity = 1,
    this.onChanged,
  });

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _increment() {
    setState(() {
      _quantity++;
      widget.onChanged?.call(_quantity);
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        widget.onChanged?.call(_quantity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _decrement,
        ),
        Text(
          '$_quantity',
          style: const TextStyle(fontSize: 16.0),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _increment,
        ),
      ],
    );
  }
}
