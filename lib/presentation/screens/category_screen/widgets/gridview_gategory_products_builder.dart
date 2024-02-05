import 'package:etoile_app/data/models/product_model.dart';
import 'package:etoile_app/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GridViewGategoryProductsBuilder extends StatelessWidget {
  const GridViewGategoryProductsBuilder({
    super.key,
    required this.products,
  });

  final List<Products> products;

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
        product: products[index],
        index: index,
      ),
      itemCount: products.length,
    );
  }
}
