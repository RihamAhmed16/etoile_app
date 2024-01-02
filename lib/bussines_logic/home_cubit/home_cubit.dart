import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:etoile_app/data/repository/store_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/home_model.dart';

part 'home_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit(this.storeRepo) : super(HomeInitial());
  StoreRepo storeRepo;
  List<HomeModel> bestSeller = [];
  List<CategoryModel> firstSections = [];
  List<CategoryModel> secondSections = [];
  List<CategoryModel> categories = [];
  CategoryModel discount =
      CategoryModel(name: 'Discount', categoryProducts: [], id: -1);

  Future<void> getBestSeller() async {
    emit(BestSellerLoadingState());
    if (bestSeller.isEmpty) {
      await FirebaseFirestore.instance
          .collection('home')
          .doc('bestSeller')
          .collection('bestsller')
          .get()
          .then((value) {
        for (var element in value.docs) {
          bestSeller.add(HomeModel.fromJson(element.data()));
        }
        print(bestSeller.first.image);
        emit(BestSellerSuccessState());
      });
    } else {
      return;
    }
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
      {required CategoryModel categoryModel, required String char}) {
    switch (char) {
      case 'z':
        categoryModel.categoryProducts!
            .sort((a, b) => b.name.compareTo(a.name));
        emit(ProductsSortingState());
        break;
      case 'a':
        categoryModel.categoryProducts!
            .sort((a, b) => a.name.compareTo(b.name));
        emit(ProductsSortingState());
        break;
      case 'h':
        categoryModel.categoryProducts!.sort(
            (a, b) => double.parse(b.price).compareTo(double.parse(a.price)));
        emit(ProductsSortingState());
        break;
      case 'l':
        categoryModel.categoryProducts!.sort(
            (a, b) => double.parse(a.price).compareTo(double.parse(b.price)));
        emit(ProductsSortingState());
        break;
      case 'n':
        categoryModel.categoryProducts!.sort((a, b) {
          var timestampA =
              double.parse(a.createdAt.millisecondsSinceEpoch.toString());
          var timestampB =
              double.parse(b.createdAt.millisecondsSinceEpoch.toString());
          return timestampB.compareTo(timestampA);
        });
        emit(ProductsSortingState());
        break;
      case 'b':
        categoryModel.categoryProducts!.sort((a, b) {
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
        firstSections= sections.sublist(0,2);
        secondSections = sections.sublist(2,4);

  }

  Future<void> getAllProducts([num? categoryId]) async {
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
}
