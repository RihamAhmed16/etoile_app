import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/user_model.dart';

part 'auth_state.dart';

class SignUpCubit extends Cubit<AuthState> {
  SignUpCubit() : super(AuthInitial());
  late String verificationId;

  static SignUpCubit get(context) => BlocProvider.of(context);
  String? otp;

  Future<void> userRegister({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        print(value.user!.email);
        print('cubit register : ${value.user!.uid}');
        userCreate(
            email: email,
            uId: value.user!.uid,
            firsName: firstName,
            phone: phone,
            lastName: lastName);
      });
    } on FirebaseException catch (ex) {
      if (ex.code == 'email-already-in-use') {
        emit(ErrorOccurred(errorMessage: 'this email already exist'));
      } else if (ex.code == 'invalid-email') {
        emit(ErrorOccurred(errorMessage: 'the email address not valid'));
      } else if (ex.code == 'operation-not-allowed') {
        emit(ErrorOccurred(errorMessage: 'your email is not enabled'));
      } else if (ex.code == 'weak-password') {
        emit(ErrorOccurred(errorMessage: 'your password is short'));
      }
    } catch (error) {
      emit(ErrorOccurred(errorMessage: error.toString()));
    }
  }

  Future<void> userCreate({
    required String email,
    required String uId,
    required String firsName,
    required String lastName,
    required String phone,
  }) async {
    UserModel userModel = UserModel(
      emailAddress: email,
      firstName: firsName,
      lastName: lastName,
      uId: uId,
      mobileNumber: phone,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap());
  }

  Future<void> submitPhoneNUmber(
      {required String phoneNumber,
      required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    emit(LoadingAuthState());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(
        seconds: 40,
      ),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationcompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('Error is ${error.toString()}');
    if (error.code == 'invalid-phone-number') {
      emit(ErrorOccurred(errorMessage: 'Please enter valid phone number'));
    } else {
      emit(ErrorOccurred(errorMessage: error.toString()));
    }
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    this.verificationId = verificationId;
    emit(PhoneSubmittedAuthState());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeVerificationTimedOut');
  }

  Future<void> submitOtp(String otpCode,
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String phoneNumber}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );
    await signIn(credential).then((value) {
      userRegister(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          phone: phoneNumber);
      emit(SuccessAuthState());
    });
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOtpVerifiedAuthState());
    } on FirebaseException catch (firebaseError) {
      if (firebaseError.code == 'invalid-verification-code') {
        emit(ErrorOccurred(errorMessage: 'your code is not valid'));
      } else if (firebaseError.code == 'invalid-verification-id') {
        emit(ErrorOccurred(errorMessage: 'your verification Id not valid'));
      } else {
        emit(ErrorOccurred(errorMessage: firebaseError.toString()));
      }
    } catch (error) {
      emit(ErrorOccurred(errorMessage: error.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
