import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());

  static LogInCubit get(context) => BlocProvider.of(context);

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
      emit(ErrorLogIn(errorMessage:error.toString()));
    }
  }

}
