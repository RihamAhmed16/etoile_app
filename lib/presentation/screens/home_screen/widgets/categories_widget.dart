import 'package:easy_localization/easy_localization.dart';
import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/translation_constance.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'build_categories_list_view.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, required this.categoriesModel});

  final List<CategoryModel> categoriesModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.h, vertical: 12.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                TranslationConstance.categories.tr(),
                style: TextStyle(
                  color: AppColors.buttonColor,
                ),
              ),
              Text(TranslationConstance.seeAll.tr()),
            ],
          ),
        ),
        SizedBox(
          height: 35.h,
          child: ListView.builder(
              itemCount: categoriesModel.length + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return index == 0
                    ? CategoryListItem(
                        categoryModel: context.read<StoreCubit>().discount,
                      )
                    : CategoryListItem(
                        categoryModel: categoriesModel[index - 1],
                      );
              }),
        ),
      ],
    );
  }
}

List<String> categoriesName = [
  'Discount',
  'Oriental Sweets',
  'Western Sweets',
  'Bakery',
  'Restaurant',
  'Chocolate',
  'Kahk and Biscuits',
  'Seyami',
];
