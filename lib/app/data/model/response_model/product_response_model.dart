import 'dart:convert';
/// id : 1
/// slug : "lorem-ipsum"
/// url : "https://jsonplaceholder.org/posts/lorem-ipsum"
/// title : "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
/// content : "Ante taciti nulla sit libero orci sed nam. Sagittis suspendisse gravida ornare iaculis cras nullam varius ac ullamcorper. Nunc euismod hendrerit netus ligula aptent potenti. Aliquam volutpat nibh scelerisque at. Ipsum molestie phasellus euismod sagittis mauris, erat ut. Gravida morbi, sagittis blandit quis ipsum mi mus semper dictum amet himenaeos. Accumsan non congue praesent interdum habitasse turpis orci. Ante curabitur porttitor ullamcorper sagittis sem donec, inceptos cubilia venenatis ac. Augue fringilla sodales in ullamcorper enim curae; rutrum hac in sociis! Scelerisque integer varius et euismod aenean nulla. Quam habitasse risus nullam enim. Ultrices etiam viverra mattis aliquam? Consectetur velit vel volutpat eget curae;. Volutpat class mus elementum pulvinar! Nisi tincidunt volutpat consectetur. Primis morbi pulvinar est montes diam himenaeos duis elit est orci. Taciti sociis aptent venenatis dui malesuada dui justo faucibus primis consequat volutpat. Rhoncus ante purus eros nibh, id et hendrerit pellentesque scelerisque vehicula sollicitudin quam. Hac class vitae natoque tortor dolor dui praesent suspendisse. Vehicula euismod tincidunt odio platea aenean habitasse neque ad proin. Bibendum phasellus enim fames risus eget felis et sem fringilla etiam. Integer."
/// image : "https://dummyimage.com/800x430/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org"
/// thumbnail : "https://dummyimage.com/200x200/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org"
/// status : "published"
/// category : "lorem"
/// publishedAt : "04/02/2023 13:25:21"
/// updatedAt : "14/03/2023 17:22:20"
/// userId : 1

ProductResponseModel productResponseModelFromJson(String str) => ProductResponseModel.fromJson(json.decode(str));
String productResponseModelToJson(ProductResponseModel data) => json.encode(data.toJson());
class ProductResponseModel {
  ProductResponseModel({
      this.id, 
      this.slug, 
      this.url, 
      this.title, 
      this.content, 
      this.image, 
      this.thumbnail, 
      this.status, 
      this.category, 
      this.publishedAt, 
      this.updatedAt, 
      this.userId,});

  ProductResponseModel.fromJson(dynamic json) {
    id = json['id'];
    slug = json['slug'];
    url = json['url'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    category = json['category'];
    publishedAt = json['publishedAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
  }
  num? id;
  String? slug;
  String? url;
  String? title;
  String? content;
  String? image;
  String? thumbnail;
  String? status;
  String? category;
  String? publishedAt;
  String? updatedAt;
  num? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['slug'] = slug;
    map['url'] = url;
    map['title'] = title;
    map['content'] = content;
    map['image'] = image;
    map['thumbnail'] = thumbnail;
    map['status'] = status;
    map['category'] = category;
    map['publishedAt'] = publishedAt;
    map['updatedAt'] = updatedAt;
    map['userId'] = userId;
    return map;
  }

}