part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class CategoriesLoadingState extends HomeState {}

class CategoriesSuccessState extends HomeState {}

class CategoriesFailureState extends HomeState {
  final String error;

  CategoriesFailureState({required this.error});
}

class BestSellerLoadingState extends HomeState {}

class BestSellerSuccessState extends HomeState {}

class BestSellerErrorState extends HomeState {
  final String error;

  BestSellerErrorState({required this.error});
}

class SectionsLoadingState extends HomeState {}

class SectionsSuccessState extends HomeState {}

class SectionsFailureState extends HomeState {
  final String error;

  SectionsFailureState({required this.error});
}
