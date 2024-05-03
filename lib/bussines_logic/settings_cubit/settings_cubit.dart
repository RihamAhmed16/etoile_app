import 'package:bloc/bloc.dart';
import 'package:etoile_app/core/DI/dependency_injecion.dart';
import 'package:etoile_app/data/repository/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.userRepo) : super(SettingsInitial());
  final UserRepo userRepo;

  Future<void> changePassword(
      {required String oldPassword, required String newPassword}) async {
    emit(ChangePasswordLoading());
    try {
      User? user = serviceLocator.get<FirebaseAuth>().currentUser;
      String email = user!.email!;

      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: oldPassword);
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
      emit(ChangePasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(
        ChangePasswordFailure(
          error: e.message ?? 'An unknown error occurred',
        ),
      );
    }
  }

  Future<void> deleteUser(
      {required String email, required String password}) async {
    emit(DeleteUserAccountLoading());
    try {
      final user = serviceLocator.get<FirebaseAuth>();
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await user.currentUser!
          .reauthenticateWithCredential(credential)
          .then((value) {
        value.user!.delete().then((value) {
          userRepo.deleteUserInformationFromDataBase().then(
            (value) {
              emit(DeleteUserAccountSuccess());
            },
          );
        });
      });
    } on FirebaseAuthException catch (error) {
      if (error.code == ' requires-recent-login') {
        emit(UserDeletionNeedReAuth());
      } else {
        print(error.message);
        emit(DeleteUserAccountFailure(
            error: error.message ?? 'An unknown error occurred'));
      }
    }
  }
  void changeLocale(Locale newLocale) {
    emit(LanguageLoaded(locale: newLocale));
  }
  // void toArabic()  {
  //   emit(LanguageLoaded(locale: const Locale('ar')));
  // }
  //
  // void toEnglish()  {
  //   emit(LanguageLoaded(
  //     locale: const Locale('en'),
  //   ));
  // }
}
