part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {}

class ErrorOccurred extends AuthState {
  final String errorMessage;

  ErrorOccurred({required this.errorMessage});
}

class PhoneSubmittedAuthState extends AuthState {}

class PhoneOtpVerifiedAuthState extends AuthState {}

class LoadingLogIn extends AuthState {}

class SuccessLogIn extends AuthState {}

class ErrorLogIn extends AuthState {
  final String errorMessage;

  ErrorLogIn({required this.errorMessage});
}

class ChangePasswordVisabilityState extends AuthState {}

class ErrorPhoneOtpVerifiedAuthState extends AuthState {
  final String error;

  ErrorPhoneOtpVerifiedAuthState(this.error);
}

class GetCurrentUserInformationLoading extends AuthState {}

class GetCurrentUserInformationSuccess extends AuthState {}

class GetCurrentUserInformationFailure extends AuthState {
  final String error;

  GetCurrentUserInformationFailure({required this.error});
}

class ForgerPasswordLoading extends AuthState {}

class ForgerPasswordSuccess extends AuthState {}

class ForgerPasswordFailure extends AuthState {
  final String error;

  ForgerPasswordFailure({required this.error});
}

class SuccessLogOut extends AuthState {}

class LoadingLogOut extends AuthState {}

class FailureLogOut extends AuthState {
  final String error;

  FailureLogOut({required this.error});
}
