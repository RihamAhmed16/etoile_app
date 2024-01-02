import 'package:etoile_app/data/models/product_model.dart';

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
    name = json['name'];
    id = json['id'];
    categoryProducts = [];
  }
}
