import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etoile_app/data/models/cart_model.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:etoile_app/data/models/product_model.dart';
import 'package:etoile_app/data/models/user_model.dart';
import 'package:etoile_app/data/repository/store_repo.dart';
import 'package:etoile_app/helper/cach_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/address_model.dart';

part 'home_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit(this.storeRepo) : super(HomeInitial());
  StoreRepo storeRepo;
  UserModel? userModel;
  double totalPrice = 0;
  List<Products> bestSeller = [];
  List<CategoryModel> firstSections = [];
  List<CategoryModel> secondSections = [];
  List<CategoryModel> categories = [];
  List<CartModel> basketProducts = [];
  List<String> productsId = [];
  List<AddressModel> address = [];
  List<Products> allProducts = [];
  List<Products> searchedProducts = [];
  bool isSearching = false;
  TextEditingController searchTerm = TextEditingController();
  Products? productDetails;
  CategoryModel discount =
      CategoryModel(name: 'Discount', categoryProducts: [], id: -1);

  Future<void> getProductDetails({required String productId}) async {
    emit(GetProductDetailsLoading());
    await storeRepo.getProductDetails(productId: productId).then((value) {
      productDetails = value;
      emit(GetProductDetailsSuccess());
    });
  }

  Future<void> getBasketProducts() async {
    emit(GetBasketsLoadingState());
    await storeRepo.getBasketProducts().then((value) {
      basketProducts = value;
      totalPrice = value.fold(
          0.0, (double accumulator, element) => accumulator + element.price);
      emit(GetBasketSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBasketFailureState(error: error.toString()));
    });
  }

  Future<void> removeFromBasket({required CartModel cartModel}) async {
    emit(RemoveFromBasketLoading());
    await storeRepo.deleteFromBasket(cartModel: cartModel).then((value) {
      int cartCount = CashHelper.getData(key: 'cartCount');
      CashHelper.saveData(
          key: 'cartCount', value: cartCount - (1 * cartModel.quantity));
      emit(RemoveFromBasketSuccess());
    }).catchError((error) {
      emit(RemoveFromBasketFailure(error: error.toString()));
    });
  }

  Future<void> addToBasket({required CartModel cartModel}) async {
    emit(AddToBasketLoading());
    await storeRepo.addToBasket(cartModel: cartModel).then((value) async {
      int cartCount = CashHelper.getData(key: 'cartCount') ?? 0;
      CashHelper.saveData(
          key: 'cartCount', value: cartCount + cartModel.quantity);
      emit(AddToBasketSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(AddToBasketFailure(error: error.toString()));
    });
  }

  Future<void> getBestSeller() async {
    emit(BestSellerLoadingState());
    if (bestSeller.isEmpty) {
      await storeRepo.getBestSellerProducts().then((value) {
        bestSeller = value
            .where((element) => element.isBestSeller == true)
            .toList()
            .sublist(0, 4);
        print(bestSeller.first.image);
        emit(BestSellerSuccessState());
      });
    } else {
      return;
    }
  }

  Future<void> updateProductQuantity(
      {required String productId,
      required int quantity,
      required String price}) async {
    final fireStore = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance.currentUser!.uid;
    double numericPrice = double.parse(price);
    int cartCount = CashHelper.getData(key: 'cartCount') ?? 0;
    print(currentUser.toString());
    emit(AddToBasketLoading());
    await fireStore
        .collection('users')
        .doc(currentUser)
        .collection('cart')
        .doc(productId)
        .update({
      'quantity': FieldValue.increment(quantity),
      'price': FieldValue.increment(numericPrice),
    }).then((value) {
      CashHelper.saveData(key: 'cartCount', value: cartCount + quantity);
      emit(AddToBasketSuccess());
    });
  }

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    if (categories.isEmpty) {
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
    } else {
      return;
    }
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
      }).catchError((error) {
        emit(ProductsErrorState(error: error.toString()));
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
      }).catchError((error) {
        emit(ProductsErrorState(error: error.toString()));
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
}
