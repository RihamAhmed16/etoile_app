import 'package:etoile_app/data/models/product_model.dart';

import '../../core/helper/language_services.dart';
import '../../helper/cach_helper.dart';

class CategoryModel {
  late String name;
  String? image;
  late num id;
  List<Products>? categoryProducts;

  CategoryModel(
      {required this.name,
      required this.categoryProducts,
      this.image,
      required this.id});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = CashHelper.getData(key: 'languageCode') == 'en'
        ? json['name']
        : json['name_ar'];
    id = json['id'];
    categoryProducts = [];
  }
}
