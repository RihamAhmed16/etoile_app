import 'package:easy_localization/easy_localization.dart';
import 'package:etoile_app/constance/app_styles.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/translation_constance.dart';
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
              '${TranslationConstance.currency.tr()} ${product.price}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  fontFamily: AppStyles.almaraiFontFamily),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              TranslationConstance.vatDetails.tr(),
              style: TextStyle(
                  color: Colors.grey.withOpacity(.6),
                  fontFamily: AppStyles.almaraiFontFamily),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '${TranslationConstance.productCode.tr()} : ${product.productCode}',
              style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: AppStyles.almaraiFontFamily),
            ),
            SizedBox(
              height: 10.h,
            ),
            RatingStarWidget(
              product: product,
            ),
            Divider(
              color: AppColors.buttonColor,
              thickness: 1.3,
            ),
            Row(
              children: [
                 Text(
                  TranslationConstance.size.tr(),
                  style:const TextStyle(color: Colors.black87),
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
                Text(
                  TranslationConstance.deliveryWithIn.tr(),
                  style: const TextStyle(
                    fontFamily: AppStyles.almaraiFontFamily,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: Text(
                    '${TranslationConstance.minute.tr()}\n${TranslationConstance.deliveryDetails.tr()}',
                    style: const TextStyle(
                        fontFamily: AppStyles.almaraiFontFamily,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
            Divider(color: AppColors.buttonColor, thickness: 1.3),
            ProductDescriptionWidget(
              productDescription: product.description,
            ),
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
