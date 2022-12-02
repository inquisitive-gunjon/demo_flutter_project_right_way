import 'Categories.dart';

class CategoryUkrbd {
  CategoryUkrbd({
      this.categories,});

  CategoryUkrbd.fromJson(dynamic json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }
  }
  List<Categories> categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categories != null) {
      map['categories'] = categories.map((v) => v.toJson()).toList();
    }
    return map;
  }

}