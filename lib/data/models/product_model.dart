import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  late String category;
  late Timestamp createdAt;
  late String description;
  late String image;
  late String name;
  late String numberInCart;
  late num rating;
  late String price;
  late String productCode;
  late String productId;
  late String size;
  late num categoryId;
  late bool isBestSeller;
  late bool isDiscount;
  late num oldPrice;
  late num discount;

  Products(
      {required this.productId,
      required this.isDiscount,
      required this.discount,
      required this.category,
      required this.oldPrice,
      required this.isBestSeller,
      required this.size,
      required this.createdAt,
      required this.description,
      required this.categoryId,
      required this.image,
      required this.name,
      required this.numberInCart,
      required this.rating,
      required this.price,
      required this.productCode});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    size = json['Size']??'';
    oldPrice = json['oldPrice'];
    discount = json['discount'];
    isBestSeller = json['isBestSeller'];
    productId = json['product_id'];
    categoryId = json['category_id'];
    isDiscount = json['isDiscount'];
    numberInCart = json['number_cart'] ?? '';
    price = json['price'] ?? '';
    category = json['category'] ?? '';
    rating = json['rating'] ?? '';
    image = json['image'] ?? '';
    productCode = json['code'] ?? '';
    description = json['descriptions'] ?? '';
    createdAt = json['created_at'] ?? '';
  }
}
