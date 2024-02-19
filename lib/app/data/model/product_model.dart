import 'dart:convert';
/// id : 1
/// title : ""
/// content : ""
/// image_url : ""
/// price : ""
/// thumbnail : ""
/// timestamp : 123456789
/// created_at : ""
/// updated_at : ""

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());
class ProductModel {
  ProductModel({
      this.id, 
      this.title, 
      this.content,
      this.imageUrl,
      this.price, 
      this.thumbnail, 
      this.timestamp, 
      this.createdAt, 
      this.updatedAt,});

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    imageUrl = json['image_url'];
    price = json['price'];
    thumbnail = json['thumbnail'];
    timestamp = json['timestamp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? title;
  String? content;
  String? imageUrl;
  String? price;
  String? thumbnail;
  num? timestamp;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['content'] = content;
    map['image_url'] = imageUrl;
    map['price'] = price;
    map['thumbnail'] = thumbnail;
    map['timestamp'] = timestamp;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}