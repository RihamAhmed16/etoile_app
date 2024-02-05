import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/DI/dependency_injecion.dart';
import '../../data/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  late String  verificationId ;
 UserModel ? userModel;
  static AuthCubit get(context) => BlocProvider.of(context);
  String? otp;

  /// register user in firebase authentication and firestore
  Future<void> userRegister({
    required UserModel userModel,
  }) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: userModel.emailAddress,
        password: userModel.password!,
      );
      await serviceLocator
          .get<FirebaseAuth>()
          .currentUser
          ?.linkWithCredential(credential)
          .then((value) {
        userCreate(
          userModel: UserModel(
            firstName: userModel.firstName,
            lastName: userModel.lastName,
            emailAddress: userModel.emailAddress,
            uId: serviceLocator
                .get<FirebaseAuth>()
                .currentUser!
                .uid,
            password: userModel.password,
            mobileNumber: userModel.mobileNumber,
          ),
        );
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

  /// create collection users in firestore
  Future<void> userCreate({
    required UserModel userModel,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(serviceLocator
        .get<FirebaseAuth>()
        .currentUser!
        .uid)
        .set(userModel.toMap());
  }

  /// authenticate with phoneNumber in firebase
  Future<void> submitPhoneNUmber({
    required UserModel userModel,
  }) async {
    emit(LoadingAuthState());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2${userModel.mobileNumber}',
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
    // await signIn(credential);
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
    print('hna verification id ${this.verificationId}');
    emit(PhoneSubmittedAuthState());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeVerificationTimedOut');
  }

  /// submit otp code and create user in fire store after sure of the mobileNumber
  Future<void> submitOtp(String otpCode, {required UserModel userModel}) async {
    emit(LoadingAuthState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );
    await signIn(credential).then((value) {
      userRegister(
        userModel: userModel,
      );
      emit(SuccessAuthState());
    });
  }

  /// sign in with phoneNumber
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

  /// logOut
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  /// logIn user
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingLogIn());
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        emit(SuccessLogIn());
      });
    } on FirebaseException catch (ex) {
      if (ex.code == 'wrong-password') {
        emit(
          ErrorLogIn(errorMessage: 'Wrong Password'),
        );
      } else if (ex.code == 'invalid-email') {
        emit(ErrorLogIn(errorMessage: 'Invalid Email'));
      } else if (ex.code == 'user-disabled') {
        emit(ErrorLogIn(errorMessage: 'Your Email Address has been Disabled'));
      } else if (ex.code == 'user-not-found') {
        emit(ErrorLogIn(errorMessage: 'This Email is not Exist'));
      } else if (ex.code == 'too-many-requests') {
        emit(ErrorLogIn(errorMessage: 'Too many requests try later'));
      } else if (ex.code == 'network-request-failed') {
        emit(ErrorLogIn(errorMessage: 'Network request failed'));
      } else {
        emit(ErrorLogIn(errorMessage: ex.message.toString()));
      }
    } catch (error) {
      emit(ErrorLogIn(errorMessage: error.toString()));
    }
  }

  /// get current user information
  Future<void> getCurrentUserInformation() async {
    emit(GetCurrentUserInformationLoading());
    await serviceLocator.get<FirebaseFirestore>().collection('users').doc(
        serviceLocator.get<FirebaseAuth>().currentUser!.uid).get().then((value) {
          userModel = UserModel.fromJson(value.data()!);
          print(userModel!.emailAddress);
          emit(GetCurrentUserInformationSuccess());
    });
  }
}