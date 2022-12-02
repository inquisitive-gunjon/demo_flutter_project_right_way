import 'Subcategories.dart';
import 'Products.dart';

class Categories {
  Categories({
      this.id, 
      this.category, 
      this.image, 
      this.priority, 
      this.status, 
      this.isDeleted, 
      this.createdAt, 
      this.updatedAt, 
      this.subcategories, 
      this.products,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    category = json['category'];
    image = json['image'];
    priority = json['priority'];
    status = json['status'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['subcategories'] != null) {
      subcategories = [];
      json['subcategories'].forEach((v) {
        subcategories.add(Subcategories.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
  }
  int id;
  String category;
  dynamic image;
  String priority;
  String status;
  dynamic isDeleted;
  String createdAt;
  String updatedAt;
  List<Subcategories> subcategories;
  List<Products> products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category'] = category;
    map['image'] = image;
    map['priority'] = priority;
    map['status'] = status;
    map['is_deleted'] = isDeleted;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (subcategories != null) {
      map['subcategories'] = subcategories.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      map['products'] = products.map((v) => v.toJson()).toList();
    }
    return map;
  }

}