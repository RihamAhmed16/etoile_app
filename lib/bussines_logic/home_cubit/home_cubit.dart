import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/home_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<HomeModel> bestSeller = [];
  List<HomeModel> sections = [];
  List<HomeModel> firstSections = [];
  List<HomeModel> secondSections = [];

  List<HomeModel> categories = [];

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
          .collection('home')
          .doc('categories')
          .collection('categories')
          .get()
          .then((value) {
        for (var element in value.docs) {
          categories.add(HomeModel.fromJson(element.data()));
        }
        emit(CategoriesSuccessState());
      }).catchError((error) {
        emit(CategoriesFailureState(error: error.toString()));
      });
    } else {
      return;
    }
  }

  Future<void> getSections() async {
    emit(SectionsLoadingState());
    if (sections.isEmpty) {
      await FirebaseFirestore.instance
          .collection('home')
          .doc('main')
          .collection('main')
          .get()
          .then((value) {
        for (var element in value.docs) {
          sections.add(HomeModel.fromJson(element.data()));
        }
        seperateSectionsList(sections: sections);
        emit(SectionsSuccessState());
      }).catchError((error) {
        emit(SectionsFailureState(error: error.toString()));
      });
    } else {
      return;
    }
  }

  void seperateSectionsList({required List<HomeModel> sections}) {
    for (var i = 0; i < sections.length; i++) {
      if (i < sections.length ~/ 2) {
        firstSections.add(sections[i]);
      } else {
        secondSections.add(sections[i]);
      }
    }
  }
}
