part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingAuthState extends AuthState{}
class SuccessAuthState extends AuthState{}
class ErrorOccurred extends AuthState {
  final String errorMessage;
  ErrorOccurred({required this.errorMessage});
}

class PhoneSubmittedAuthState extends AuthState{}

class PhoneOtpVerifiedAuthState extends AuthState{}

class ErrorPhoneOtpVerifiedAuthState extends AuthState{
  final String error;
  ErrorPhoneOtpVerifiedAuthState(this.error);
}
