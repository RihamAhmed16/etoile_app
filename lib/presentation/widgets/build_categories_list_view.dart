import 'package:etoile_app/data/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constance/colors.dart';

class BuildItemCategoriesListView extends StatelessWidget {
  const BuildItemCategoriesListView({super.key, required this.categoriesModel,});
final HomeModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 35.h,
      margin: EdgeInsets.symmetric(horizontal: 5.h),
      padding: EdgeInsets.only(right: 4.w),
      decoration: BoxDecoration(
        color: AppColors.lightBlack,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                categoriesModel.image??'',
                height: 35.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
          Expanded(
            flex: 3,
            child: Text(
              categoriesModel.catName??'',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
