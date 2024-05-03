import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etoile_app/data/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/DI/dependency_injecion.dart';
import 'models/address_model.dart';

class AddressApiCall {
  final fireBase = serviceLocator.get<FirebaseFirestore>();
  static final currentUser =
      serviceLocator.get<FirebaseAuth>().currentUser!.uid;

  Future<QuerySnapshot<Map<String, dynamic>>> getAddress() async {
    return await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('Address')
        .get();
  }

  Future<void> addAddress({required AddressModel addressModel}) async {
    await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('Address')
        .doc(addressModel.id).set(addressModel.toJson());
  }

  Future<void> deleteAddress({required String id}) async {
    await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('Address')
        .doc(id)
        .delete();
  }

  Future<void> addOrder({required OrderModel order, required String id}) async {
    await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('orders')
        .doc(id)
        .set(order.toJson());
  }

  Future<void> clearBasket() async {
    // Get a reference to the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Navigate to the "cart" collection under the user's document
    CollectionReference userCartCollection =
        firestore.collection('users').doc(currentUser).collection('cart');

    // Get all the documents in the "cart" collection
    QuerySnapshot cartSnapshot = await userCartCollection.get();

    // Iterate through each document and delete it
    for (QueryDocumentSnapshot cartDoc in cartSnapshot.docs) {
      await cartDoc.reference.delete();
    }

    // After deleting all documents, delete the "cart" collection itself
    await userCartCollection.doc('cart').delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getAddressDetails(
      {required String addressId}) async {
    return await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('address')
        .doc(addressId)
        .get();
  }

  Future<void> updateAddressDetails(
      {required AddressModel addressModel}) async {
    await fireBase
        .collection('users')
        .doc(currentUser)
        .collection('Address')
        .doc(addressModel.id)
        .update(
          addressModel.toJson(),
        );
  }
}
