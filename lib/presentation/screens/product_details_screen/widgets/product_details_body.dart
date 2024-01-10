import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/data/models/product_model.dart';
import 'package:etoile_app/presentation/screens/product_details_screen/widgets/product_description_widget.dart';
import 'package:etoile_app/presentation/screens/product_details_screen/widgets/product_size_widget.dart';
import 'package:etoile_app/presentation/screens/product_details_screen/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'details_container_widget.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.product});

  final Products product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.image,
                height: 160.h,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                Icon(
                  Icons.share,
                  color: AppColors.buttonColor,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'EGP ${product.price}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              'All Prices include VAT Details',
              style: TextStyle(
                color: Colors.grey.withOpacity(.6),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Product Code : ${product.productCode}',
              style: const TextStyle(color: Colors.black87),
            ),
            SizedBox(
              height: 10.h,
            ),
            RatingStarWidget(product: product,),
            Divider(
              color: AppColors.buttonColor,
              thickness: 1.3,
            ),
            Row(
              children: [
                const Text(
                  'Size',
                  style: TextStyle(color: Colors.black87),
                ),
                SizedBox(
                  width: 10.w,
                ),
                ProductSizeWidget(product: product),
              ],
            ),
            Divider(color: AppColors.buttonColor, thickness: 1.3),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Delivered\n Within'),
                SizedBox(
                  width: 15.w,
                ),
                const Expanded(
                  child: Text(
                      '45 - 60 mins\nOrder may delivered lately many Minutes in case rush hours (The product may differ from the image\ndaily)'),
                ),
              ],
            ),
            Divider(color: AppColors.buttonColor, thickness: 1.3),
            ProductDescriptionWidget(productDescription: product.description,),
            Divider(color: AppColors.buttonColor, thickness: 1.3),
            DetailsContainerWidget(product: product),
            Divider(color: AppColors.buttonColor, thickness: 1.3),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }
}




