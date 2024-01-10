import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etoile_app/data/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiCall {
  final fireBase = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser!.uid;

  Future<QuerySnapshot<Map<String, dynamic>>> getCategoryProducts(
      {required num categoryId}) async {
    return await fireBase
        .collection('products')
        .where(
          'category_id',
          isEqualTo: categoryId,
        )
        .get();
  }
  Future<DocumentSnapshot<Map<String, dynamic>>> getProductDetails(
      {required String productId}) async {
    return await fireBase
        .collection('products')
        .doc(productId)
        .get();
  }
  Future<QuerySnapshot<Map<String, dynamic>>> getDiscountProducts() async {
    return await fireBase
        .collection('products')
        .where('isDiscount', isEqualTo: true)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllProducts() async {
    return await fireBase.collection('products').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getBasketProducts() async {
    return await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('cart')
        .get();
  }

  Future<void> addToBasket({required CartModel cartModel}) async {
    await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('cart')
        .doc(cartModel.productId)
        .set({
      'product_id': cartModel.productId,
      'image': cartModel.image,
      'quantity': cartModel.quantity,
      'price': cartModel.price,
      'name': cartModel.name,
    });
  }
}
