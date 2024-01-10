import 'package:etoile_app/data/api_call.dart';
import 'package:etoile_app/data/models/cart_model.dart';

import '../models/product_model.dart';

class StoreRepo {
  final apiCall = ApiCall();

  Future<List<Products>> getCategoryProducts({required num categoryId}) async {
    final response = await apiCall.getCategoryProducts(categoryId: categoryId);
    return response.docs
        .map((element) => Products.fromJson(element.data()))
        .toList();
  }

  Future<List<Products>> getDiscountProducts() async {
    final response = await apiCall.getDiscountProducts();
    return response.docs
        .map((element) => Products.fromJson(element.data()))
        .toList();
  }

  Future<List<CartModel>> getBasketProducts() async {
    final response = await apiCall.getBasketProducts();
    return response.docs
        .map((element) => CartModel.fromJson(element.data()))
        .toList();
  }

  Future<List<Products>> getBestSellerProducts() async {
    final response = await apiCall.getAllProducts();
    return response.docs
        .map((element) => Products.fromJson(element.data()))
        .toList();
  }

  Future<void> addToBasket ({required CartModel cartModel}) async {
    await apiCall.addToBasket(cartModel: cartModel);
  }
  Future<Products> getProductDetails  ({required String productId}) async {
  final response  = await apiCall.getProductDetails(productId: productId);

  return Products.fromJson(response.data()??{});
  }
}