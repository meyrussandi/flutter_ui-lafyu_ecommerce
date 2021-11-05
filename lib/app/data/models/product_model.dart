class Product {
  String? name;
  double? originalPrice;
  int? discount;
  double? discountPrice;
  double? totalPrice;
  int? rating;

  Product(
      {this.name,
      this.originalPrice,
      this.discount,
      this.discountPrice,
      this.totalPrice,
      this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    originalPrice = json['original_price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    totalPrice = json['total_price'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['original_price'] = originalPrice;
    data['discount'] = discount;
    data['discount_price'] = discountPrice;
    data['total_price'] = totalPrice;
    data['rating'] = rating;
    return data;
  }
}
