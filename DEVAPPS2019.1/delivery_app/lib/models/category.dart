import 'package:delivery_app/models/item.dart';

class Category {
  String imageURL;
  String title;
  List<Item> items;

  Category({this.imageURL, this.title, this.items});

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    title: json['title'] as String,
    imageURL: json['imageURL'] as String,
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
