import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:etoile_app/constance/translation_constance.dart';
import 'package:etoile_app/core/DI/dependency_injecion.dart';
import 'package:etoile_app/data/models/cart_model.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:etoile_app/data/models/product_model.dart';
import 'package:etoile_app/data/models/user_model.dart';
import 'package:etoile_app/data/repository/address_repo.dart';
import 'package:etoile_app/data/repository/store_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/address_model.dart';

part 'home_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit(this.storeRepo, this.addressRepo) : super(HomeInitial());
  StoreRepo storeRepo;
  AddressRepo addressRepo;
  UserModel? userModel;
  double totalPrice = 0;
  List<Products> subListBestSeller = [];
  List<Products> allBestSeller = [];
  List<CategoryModel> firstSections = [];
  List<CategoryModel> secondSections = [];
  List<CategoryModel> categories = [];
  List<CartProduct> basketProducts = [];
  List<String> productsId = [];
  List<AddressModel> address = [];
  List<Products> allProducts = [];
  List<Products> searchedProducts = [];
  bool isSearching = false;
  TextEditingController searchTerm = TextEditingController();
  Products? productDetails;
  CategoryModel discount = CategoryModel(
      name: TranslationConstance.discount.tr(), categoryProducts: [], id: -1);

  Future<void> getProductDetails({required String productId}) async {
    emit(GetProductDetailsLoading());
    await storeRepo.getProductDetails(productId: productId).then((value) {
      productDetails = value;
      emit(GetProductDetailsSuccess());
    });
  }

  Future<void> getBasketProducts() async {
    if (serviceLocator.get<FirebaseAuth>().currentUser != null) {
      emit(GetBasketsLoadingState());
      await storeRepo.getBasketProducts().then((value) {
        basketProducts = value;
        totalPrice = value.fold(
            0.0,
            (double accumulator, element) =>
                accumulator + (element.price * element.quantity));
        emit(GetBasketSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetBasketFailureState(error: error.toString()));
      });
    } else {
      return;
    }
  }

  Future<void> removeFromBasket({required CartProduct cartModel}) async {
    emit(RemoveFromBasketLoading());
    await storeRepo.deleteFromBasket(cartModel: cartModel).then((value) {
      emit(RemoveFromBasketSuccess());
    }).catchError((error) {
      emit(RemoveFromBasketFailure(error: error.toString()));
    });
  }

  Future<void> addToBasket({required CartProduct cartModel}) async {
    emit(AddToBasketLoading());
    await storeRepo.addToBasket(cartModel: cartModel).then((value) async {
      emit(AddToBasketSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(AddToBasketFailure(error: error.toString()));
    });
  }

  Future<void> getBestSeller() async {
    subListBestSeller.clear();
    allBestSeller.clear();
    emit(BestSellerLoadingState());
    await storeRepo.getBestSellerProducts().then((value) {
      subListBestSeller = value
          .where((element) => element.isBestSeller == true)
          .toList()
          .sublist(0, 4);
      allBestSeller =
          value.where((element) => element.isBestSeller == true).toList();
      print(subListBestSeller.first.image);
      emit(BestSellerSuccessState());
    });
  }

  Future<void> updateProductQuantity(
      {required String productId,
      required int quantity,
      required double price}) async {
    final fireStore = serviceLocator.get<FirebaseFirestore>();
    final currentUser = serviceLocator.get<FirebaseAuth>().currentUser!.uid;
    print(currentUser.toString());
    emit(AddToBasketLoading());
    await fireStore
        .collection('users')
        .doc(currentUser)
        .collection('cart')
        .doc(productId)
        .update({
      'quantity': FieldValue.increment(quantity),
      'price': FieldValue.increment(price),
    }).then((value) {
      emit(AddToBasketSuccess());
    });
  }

  Future<void> decreaseQuantityAndPrice(
      {required CartProduct productCart}) async {
    emit(UpdateQuantityLoading());
    final fireStore = serviceLocator.get<FirebaseFirestore>();
    final currentUser = serviceLocator.get<FirebaseAuth>().currentUser!.uid;
    await fireStore
        .collection('users')
        .doc(currentUser)
        .collection('cart')
        .doc(productCart.productId)
        .update({
      'quantity': productCart.quantity - 1,
    }).then((value) {
      emit(UpdateQuantitySuccess());
    });
  }

  Future<void> incrementQuantityAndPrice(
      {required CartProduct productCart}) async {
    emit(UpdateQuantityLoading());
    final fireStore = serviceLocator.get<FirebaseFirestore>();
    final currentUser = serviceLocator.get<FirebaseAuth>().currentUser!.uid;
    await fireStore
        .collection('users')
        .doc(currentUser)
        .collection('cart')
        .doc(productCart.productId)
        .update({
      'quantity': productCart.quantity + 1,
    }).then((value) {
      emit(UpdateQuantitySuccess());
    });
  }

  Future<void> getCategories() async {
    categories.clear();
    emit(CategoriesLoadingState());
    await FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((value) {
      for (var element in value.docs) {
        categories.add(CategoryModel.fromJson(element.data()));
      }
      seperateCategoriesList(sections: categories);
      emit(CategoriesSuccessState());
    });
  }

  void sortingProducts(
      {required List<Products> products, required String char}) {
    switch (char) {
      case 'z':
        products.sort((a, b) => b.name.compareTo(a.name));
        emit(ProductsSortingState());
        break;
      case 'a':
        products.sort((a, b) => a.name.compareTo(b.name));
        emit(ProductsSortingState());
        break;
      case 'h':
        products.sort(
            (a, b) => double.parse(b.price).compareTo(double.parse(a.price)));
        emit(ProductsSortingState());
        break;
      case 'l':
        products.sort(
            (a, b) => double.parse(a.price).compareTo(double.parse(b.price)));
        emit(ProductsSortingState());
        break;
      case 'n':
        products.sort((a, b) {
          var timestampA =
              double.parse(a.createdAt.millisecondsSinceEpoch.toString());
          var timestampB =
              double.parse(b.createdAt.millisecondsSinceEpoch.toString());
          return timestampB.compareTo(timestampA);
        });
        emit(ProductsSortingState());
        break;
      case 'b':
        products.sort((a, b) {
          if (a.isBestSeller && !b.isBestSeller) {
            return -1;
          } else if (!a.isBestSeller && b.isBestSeller) {
            return 1;
          } else {
            return 0;
          }
        });
        emit(ProductsSortingState());
        break;
    }
  }

  void seperateCategoriesList({required List<CategoryModel> sections}) {
    firstSections = sections.sublist(0, 2);
    secondSections = sections.sublist(2, 4);
  }

  Future<void> getCategoriesAndDiscountProducts([num? categoryId]) async {
    if (categories
        .firstWhere((element) => element.id.toString() == categoryId.toString(),
            orElse: () => discount)
        .categoryProducts!
        .isNotEmpty) return;
    emit(ProductsLoadingState());
    if (categoryId == -1) {
      await storeRepo.getDiscountProducts().then((value) {
        for (var product in value) {
          discount.categoryProducts!.add(product);
        }
      });
    } else {
      await storeRepo
          .getCategoryProducts(categoryId: categoryId!)
          .then((value) {
        for (var category in categories) {
          if (category.id == categoryId) {
            category.categoryProducts!
                .addAll(value.where((element) => element.isDiscount == false));
          }
        }
      });
    }
    emit(ProductsSuccessState());
  }

  Future<void> getAllProducts() async {
    emit(GetAllProductsLoadingState());
    await storeRepo.getAllProducts().then((value) {
      allProducts = value;
      emit(GetAllProductsSuccessState());
    }).catchError((error) {
      emit(GetAllProductsFailureState(error: error.toString()));
    });
  }

  void searchProduct(
      {required String searchTerm, required List<Products> products}) {
    try {
      if (searchTerm.isEmpty || searchTerm == '') {
        return;
      } else {
        if (allProducts.isNotEmpty) {
          searchedProducts = products
              .where(
                  (element) => element.name.toLowerCase().contains(searchTerm))
              .toList();
          emit(SearchedProductsSuccessState());
          isSearching = true;
        } else {
          return;
        }
      }
    } catch (error) {
      emit(SearchedProductsFailureState(error: error.toString()));
    }
  }

  void clearSearchedList() {
    searchedProducts.clear();
    isSearching = false;
    emit(ClearSearchedProductsList());
  }

  Future<void> getAllAddresses() async {
    if (serviceLocator.get<FirebaseAuth>().currentUser != null) {
      emit(GetAllAddressesLoading());
      await addressRepo.getAddress().then((value) {
        address = value;
        emit(GetAllProductsSuccessState());
      }).catchError((error) {
        print(error);
      });
    }
  }
}
