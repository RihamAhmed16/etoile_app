import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etoile_app/helper/cach_helper.dart';

import '../../core/helper/language_services.dart';

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
    name = CashHelper.getData(key: 'languageCode') == 'en'
        ? json['name']
        : json['name_ar'];
    size = CashHelper.getData(key: 'languageCode') == 'en'
        ? json['Size'] ?? ''
        : json['size_ar'];
    oldPrice = json['oldPrice'];
    discount = json['discount'];
    isBestSeller = json['isBestSeller'];
    productId = json['product_id'];
    categoryId = json['category_id'];
    isDiscount = json['isDiscount'];
    numberInCart = json['number_cart'] ?? '';
    price = json['price'] ?? '';
    category = CashHelper.getData(key: 'languageCode') == 'en'
        ? json['category'] ?? ''
        : json['category_ar'];
    rating = json['rating'] ?? '';
    image = json['image'] ?? '';
    productCode = json['code'] ?? '';
    description = CashHelper.getData(key: 'languageCode') == 'en'
        ? json['descriptions'] ?? ''
        : json['descriptions_ar'];
    createdAt = json['created_at'] ?? '';
  }
}
