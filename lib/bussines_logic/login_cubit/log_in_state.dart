part of 'log_in_cubit.dart';

abstract class LogInState {}

class LogInInitial extends LogInState {}

class LoadingLogIn extends LogInState {}

class SuccessLogIn extends LogInState {}

class ErrorLogIn extends LogInState {
  final String errorMessage;

  ErrorLogIn({required this.errorMessage});
}

class ChangePasswordVisabilityState extends LogInState {}
