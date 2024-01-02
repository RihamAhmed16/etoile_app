import 'package:cloud_firestore/cloud_firestore.dart';

class ApiCall {
  final fireBase = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getCategoryProducts(
      {required num categoryId}) async {
    return await fireBase
        .collection('products')
        .where('category_id', isEqualTo: categoryId,)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getDiscountProducts() async {
    return await fireBase
        .collection('products')
        .where('isDiscount', isEqualTo: true)
        .get();
  }
  Future<QuerySnapshot<Map<String, dynamic>>> getAllProducts() async {
    return await fireBase
        .collection('products')
        .get();
  }
}
