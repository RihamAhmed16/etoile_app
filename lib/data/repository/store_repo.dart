import 'package:etoile_app/data/api_call.dart';

import '../models/product_model.dart';

class StoreRepo {
  final apiCall = ApiCall();

  Future<List<Products>> getCategoryProducts({required num categoryId}) async {
    final response = await apiCall.getCategoryProducts(categoryId: categoryId);
    return  response.docs
        .map((element) => Products.fromJson(element.data()))
        .toList();
  }
  Future<List<Products>> getDiscountProducts() async {
    final response = await apiCall.getDiscountProducts();
    return  response.docs
        .map((element) => Products.fromJson(element.data()))
        .toList();
  }
  Future<List<Products>> getAllProducts() async {
    final response = await apiCall.getAllProducts();
    return  response.docs
        .map((element) => Products.fromJson(element.data()))
        .toList();
  }
}
