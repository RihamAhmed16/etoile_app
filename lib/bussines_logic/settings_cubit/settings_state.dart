part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class ChangePasswordLoading extends SettingsState {}

class ChangePasswordSuccess extends SettingsState {}

class UserDeletionNeedReAuth extends SettingsState {}

class ChangePasswordFailure extends SettingsState {
  final String error;

  ChangePasswordFailure({required this.error});
}

class DeleteUserAccountLoading extends SettingsState {}

class DeleteUserAccountSuccess extends SettingsState {}

class DeleteUserAccountFailure extends SettingsState {
  final String error;

  DeleteUserAccountFailure({required this.error});
}

class LanguageLoaded extends SettingsState {
  final Locale locale;

  LanguageLoaded({required this.locale});
}
