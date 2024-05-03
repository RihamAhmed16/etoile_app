import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etoile_app/core/DI/dependency_injecion.dart';
import 'package:etoile_app/data/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiCall {
  final fireBase = serviceLocator.get<FirebaseFirestore>();
  static final currentUser =
      serviceLocator.get<FirebaseAuth>().currentUser!.uid;

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
    return await fireBase.collection('products').doc(productId).get();
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

  Future<void> addToBasket({required CartProduct cartModel}) async {
    await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('cart')
        .doc(cartModel.productId)
        .set(cartModel.toJson());
  }

  Future<void> deleteFromBasket({required CartProduct cartModel}) async {
    await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('cart')
        .doc(cartModel.productId)
        .delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>>
      getCurrentUserInformation() async {
    return await fireBase.collection('users').doc(currentUser).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAddress() async {
    return await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('Address')
        .get();
  }
}
