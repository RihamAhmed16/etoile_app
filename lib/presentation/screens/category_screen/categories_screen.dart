import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/categories_screen_body.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.categoryModel,});

  final CategoryModel categoryModel;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    context.read<StoreCubit>().getCategoriesAndDiscountProducts(widget.categoryModel.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:AppColors.backgroundColor,
      body: SafeArea(
        child: CategoriesScreenBody(
          categoryModel: widget.categoryModel,
        ),
      ),
    );
  }
}
