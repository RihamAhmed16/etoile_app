part of 'home_cubit.dart';

abstract class StoreState {}

class HomeInitial extends StoreState {}

class CategoriesLoadingState extends StoreState {}

class CategoriesSuccessState extends StoreState {}

class CategoriesFailureState extends StoreState {
  final String error;

  CategoriesFailureState({required this.error});
}

class BestSellerLoadingState extends StoreState {}

class BestSellerSuccessState extends StoreState {}

class BestSellerErrorState extends StoreState {
  final String error;

  BestSellerErrorState({required this.error});
}

class SectionsLoadingState extends StoreState {}

class SectionsSuccessState extends StoreState {}

class SectionsFailureState extends StoreState {
  final String error;

  SectionsFailureState({required this.error});
}
class ProductsLoadingState extends StoreState {}
class ProductsSortingState extends StoreState {}
class ProductsSuccessState extends StoreState {}
class ProductsErrorState extends StoreState {
  final String error;

  ProductsErrorState({required this.error});

}