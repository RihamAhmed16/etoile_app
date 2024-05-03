import 'package:etoile_app/data/store_api_call.dart';
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

  Future<List<CartProduct>> getBasketProducts() async {
    final response = await apiCall.getBasketProducts();
    return response.docs
        .map((element) => CartProduct.fromJson(element.data()))
        .toList();
  }

  Future<List<Products>> getAllProducts() async {
    final response = await apiCall.getAllProducts();
    return response.docs
        .map((product) => Products.fromJson(product.data()))
        .toList();
  }

  Future<List<Products>> getBestSellerProducts() async {
    final response = await apiCall.getAllProducts();
    return response.docs
        .map((element) => Products.fromJson(element.data()))
        .toList();
  }

  Future<void> addToBasket({required CartProduct cartModel}) async {
    await apiCall.addToBasket(cartModel: cartModel);
  }

  Future<void> deleteFromBasket({required CartProduct cartModel}) async {
    await apiCall.deleteFromBasket(cartModel: cartModel);
  }

  Future<Products> getProductDetails({required String productId}) async {
    final response = await apiCall.getProductDetails(productId: productId);

    return Products.fromJson(response.data() ?? {});
  }

  Future<void> updateProductQuantity(
      {required String productId,
      required int quantity,
      required String price}) async {

  }
}
