import 'package:etoile_app/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/category_model.dart';

class GridViewGategoryProductsBuilder extends StatelessWidget {
  const GridViewGategoryProductsBuilder({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: .65,
      ),
      itemBuilder: (context, index) => ProductItem(
        product: categoryModel.categoryProducts![index],
        index: index,
      ),
      itemCount: categoryModel.categoryProducts!.length,
    );
  }
}
