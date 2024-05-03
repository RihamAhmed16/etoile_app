import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../bussines_logic/home_cubit/home_cubit.dart';

class FinalCostWidget extends StatelessWidget {
  const FinalCostWidget({
    super.key,
    required this.totalPrice,
    required this.shippingValue,
  });

  final double totalPrice;
  final double shippingValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                spreadRadius: 1.9,
                offset: Offset(.9, 2),
                blurStyle: BlurStyle.normal),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Item(s) Price :'),
                Text(
                  '${formatItemsPrice(itemsPrice: context.read<StoreCubit>().totalPrice)} EGP',
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Shipping :'),
                Text(shippingValue.toString()),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total :'),
                Text(
                    '${totalPrice.toStringAsFixed(totalPrice.truncateToDouble() == totalPrice ? 0 : 2)} EGP'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String formatItemsPrice({required double itemsPrice}) {
  String formattedPrice = itemsPrice
      .toStringAsFixed(itemsPrice.truncateToDouble() == itemsPrice ? 0 : 2);
  formattedPrice = formattedPrice.replaceAll(
      RegExp(r"([.]*0)(?!.*\d)"), ""); // Remove trailing
  return formattedPrice;
}
