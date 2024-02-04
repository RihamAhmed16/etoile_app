import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constance/colors.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.categoriesScreen,
          arguments: categoryModel,
        );
      },
      child: Container(
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
            if(categoryModel.image!=null)
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  categoryModel.image ??'',
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
                categoryModel.name ,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
