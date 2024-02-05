part of 'home_cubit.dart';

abstract class StoreState {}

class HomeInitial extends StoreState {}

class CategoriesLoadingState extends StoreState {}

class CategoriesSuccessState extends StoreState {}

class CategoriesFailureState extends StoreState {
  final String error;

  CategoriesFailureState({required this.error});
}
class RemoveFromBasketLoading extends StoreState {}
class RemoveFromBasketSuccess extends StoreState {}
class RemoveFromBasketFailure extends StoreState {
  final String error;
  RemoveFromBasketFailure({required this.error});
}
class GetProductDetailsLoading extends StoreState {}

class GetProductDetailsSuccess extends StoreState {

  GetProductDetailsSuccess();
}

class GetProductDetailsFailure extends StoreState {
  final String error;

  GetProductDetailsFailure({required this.error});
}

class GetBasketsLoadingState extends StoreState {}

class GetBasketSuccessState extends StoreState {}

class GetBasketFailureState extends StoreState {
  final String error;

  GetBasketFailureState({required this.error});
}

class AddToBasketLoading extends StoreState {}

class AddToBasketSuccess extends StoreState {}

class AddToBasketFailure extends StoreState {
  final String error;

  AddToBasketFailure({required this.error});
}

class QuantityUpdatedState extends StoreState {
  final int quantity;

  QuantityUpdatedState(this.quantity);
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
class GetAllProductsLoadingState extends StoreState {}
class GetAllProductsSuccessState extends StoreState {}
class GetAllProductsFailureState extends StoreState {
  final String error;

  GetAllProductsFailureState({required this.error});
}
class SearchedProductsSuccessState extends StoreState {}
class SearchedProductsFailureState extends StoreState {
   final String error;

  SearchedProductsFailureState({required this.error});
}
class ClearSearchedProductsList extends StoreState {}