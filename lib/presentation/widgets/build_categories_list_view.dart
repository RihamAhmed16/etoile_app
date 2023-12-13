import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constance/colors.dart';

class BuildItemCategoriesListView extends StatelessWidget {
  const BuildItemCategoriesListView({super.key, required this.categoriesName});

  final String categoriesName;

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
                'https://t3.ftcdn.net/jpg/00/78/46/66/240_F_78466601_5nXFPeyzmHIBahgGWDYuVbcLxIjALcQG.jpg',
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
              categoriesName,
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
