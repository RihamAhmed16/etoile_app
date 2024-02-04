import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/DI/dependency_injecion.dart';
import 'models/order_model.dart';

class OrdersApiCall {
  final fireBase = serviceLocator.get<FirebaseFirestore>();
  static final currentUser =
      serviceLocator.get<FirebaseAuth>().currentUser!.uid;
  Future<QuerySnapshot<Map<String, dynamic>>> getOrders() async {
    return await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('orders')
        .get();
  }
  Future<void> addOrder({required OrderModel order, required String id}) async {
    await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('orders')
        .doc(id)
        .set(order.toJson());
  }
}