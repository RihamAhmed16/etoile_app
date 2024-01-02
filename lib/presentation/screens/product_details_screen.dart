import 'package:etoile_app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constance/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product,});
final Products product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                spreadRadius: 2.7,
                offset: Offset(.9, 2),
                blurStyle: BlurStyle.normal),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 7.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.black54.withOpacity(.5),
                  ),
                  child: const Icon(Icons.add),
                ),
                SizedBox(
                  width: 7.w,
                ),
                const Text('1'),
                SizedBox(
                  width: 7.w,
                ),
                Container(
                  width: 24.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.black54.withOpacity(.5),
                  ),
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomButton(
                text: 'Add To Basket',
                width: double.infinity,
                buttonColor: AppColors.buttonColor),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(),
      body:  ProductDetailsBody(product: product),
    );
  }
}
