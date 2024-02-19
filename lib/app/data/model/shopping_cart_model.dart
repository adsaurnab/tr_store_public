import 'dart:convert';
/// id : 1
/// product_id : 2
/// user_id : 1
/// total_products : ""
/// total_amount : ""
/// timestamp : ""
/// title : ""
/// price : ""
/// thumbnail : ""
/// created_at : ""
/// updated_at : ""

ShoppingCartModel shoppingCartModelFromJson(String str) => ShoppingCartModel.fromJson(json.decode(str));
String shoppingCartModelToJson(ShoppingCartModel data) => json.encode(data.toJson());
class ShoppingCartModel {
  ShoppingCartModel({
      this.id, 
      this.productId, 
      this.userId, 
      this.totalProducts, 
      this.totalAmount, 
      this.title,
      this.price,
      this.thumbnail,
      this.timestamp,
      this.createdAt, 
      this.updatedAt,});

  ShoppingCartModel.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    totalProducts = json['total_products'];
    totalAmount = json['total_amount'];
    title = json['title'];
    price = json['price'];
    thumbnail = json['thumbnail'];
    timestamp = json['timestamp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? productId;
  num? userId;
  String? totalProducts;
  String? totalAmount;
  String? title;
  String? price;
  String? thumbnail;
  num? timestamp;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['user_id'] = userId;
    map['total_products'] = totalProducts;
    map['total_amount'] = totalAmount;
    map['title'] = title;
    map['price'] = price;
    map['thumbnail'] = thumbnail;
    map['timestamp'] = timestamp;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}