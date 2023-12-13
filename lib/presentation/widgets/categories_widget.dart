import 'package:etoile_app/constance/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'build_categories_list_view.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

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
                'Categories',
                style: TextStyle(
                  color: AppColors.buttonColor,
                ),
              ),
              const Text('See All'),
            ],
          ),
        ),
        SizedBox(
          height: 35.h,
          child: ListView.builder(
            itemCount: 8,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => BuildItemCategoriesListView(
              categoriesName: categoriesName[index],
            ),
          ),
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
