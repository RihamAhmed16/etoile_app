import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bussines_logic/home_cubit/home_cubit.dart';
import '../../../data/models/product_model.dart';

void sortingDialog(BuildContext context, {required List<Products> products}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding:
        EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sort By:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
                onTap: () {
                  context
                      .read<StoreCubit>()
                      .sortingProducts(products: products, char: 'l');
                  Navigator.pop(context);
                },
                child: const Text('Price Low To High')),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
                onTap: () {
                  context
                      .read<StoreCubit>()
                      .sortingProducts(products: products, char: 'h');
                  Navigator.pop(context);
                },
                child: const Text('Price High To Low')),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
                onTap: () {
                  context
                      .read<StoreCubit>()
                      .sortingProducts(products: products, char: 'b');
                  Navigator.pop(context);
                },
                child: const Text('Best Seller')),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
                onTap: () {
                  context
                      .read<StoreCubit>()
                      .sortingProducts(products: products, char: 'n');
                  Navigator.pop(context);
                },
                child: const Text('New Arrivals')),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
                onTap: () {
                  context
                      .read<StoreCubit>()
                      .sortingProducts(products: products, char: 'a');
                  Navigator.pop(context);
                },
                child: const Text('Product Name A-Z')),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
                onTap: () {
                  context
                      .read<StoreCubit>()
                      .sortingProducts(products: products, char: 'z');
                  Navigator.pop(context);
                },
                child: const Text('Product Name Z-A')),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ));
}
