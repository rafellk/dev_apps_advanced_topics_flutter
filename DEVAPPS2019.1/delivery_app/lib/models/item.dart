class Item {
  String title;
  String imageURL;
  double price;
  String unit;

  Item({this.title, this.imageURL, this.price, this.unit});

  factory Item.fromJson(Map<String, dynamic> json) {
    return _$ItemFromJson(json);
  }
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
      title: json['title'] as String,
      imageURL: json['imageURL'] as String,
      price: json['price'] as double,
      unit: json['unit'] as String);
}
