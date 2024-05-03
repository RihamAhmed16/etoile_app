import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/DI/dependency_injecion.dart';

class UserApiCall {
  final fireBase = serviceLocator.get<FirebaseFirestore>();
  static final currentUser = serviceLocator.get<FirebaseAuth>().currentUser!;

  Future<void> deleteUserInformationFromDataBase() async {
    await fireBase.collection('users').doc(currentUser.uid).delete();
  }

  Future<void> deleteUserAccount() async {
    await currentUser.delete();
  }
}
