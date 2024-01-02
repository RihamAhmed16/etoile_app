
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  List<Products> allProducts = [];
  List<Products> productsByCategory = [];
  List<CategoryModel> categories = [];

  Future<void> getAllProducts({required String categoryId}) async {
    emit(CategoriesLoading());
    await FirebaseFirestore.instance
        .collection('products')
        .where('category_id', isEqualTo: categoryId)
        .get()
        .then((value) {
      for (var product in value.docs) {
        productsByCategory.add(Products.fromJson(product.data()));
        print(productsByCategory.length);
        for (var category in categories) {
          category.categoryProducts?.add(Products.fromJson(product.data()));
        }
      }
      emit(CategoriesSuccess());
    });
  }

  // void getSpecificProductsOfCategory() {
  //   for (var product in allProducts) {
  //     for (var category in categories) {
  //       if (category.name == product.category) {
  //         category.categoryProducts.add(product);
  //       } else {
  //         categories.add(CategoryModel(
  //             name: product.category, categoryProducts: [product]));
  //       }
  //     }
  //   }
  // }

  List<Products> getSpecificCategoryProducts({required String category}) {
    emit(CategoriesLoading());
    switch (category) {
      case 'Restaurant':
        productsByCategory = allProducts
            .where((element) => element.category == 'Restaurant')
            .toList();
        return productsByCategory;
      case 'Bakery':
        productsByCategory = allProducts
            .where((element) => element.category == 'Bakery')
            .toList();
        return productsByCategory;
      case 'seyami':
        productsByCategory = allProducts
            .where((element) => element.category == 'seyami')
            .toList();
        return productsByCategory;
      case 'Western Sweets':
        productsByCategory = allProducts
            .where((element) => element.category == 'Western Sweets')
            .toList();
        return productsByCategory;
      case 'Oriental Sweets':
        productsByCategory = allProducts
            .where((element) => element.category == 'Oriental Sweets')
            .toList();
        return productsByCategory;
      case 'Kahk and Biscuits':
        productsByCategory = allProducts
            .where((element) => element.category == 'Kahk and Biscuits')
            .toList();
        return productsByCategory;
      case 'Chocolate':
        productsByCategory = allProducts
            .where((element) => element.category == 'Chocolate')
            .toList();
        return productsByCategory;
    }
    return [];
  }
}
