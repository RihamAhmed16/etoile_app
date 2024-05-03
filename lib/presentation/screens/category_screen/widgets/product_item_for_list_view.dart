import 'package:easy_localization/easy_localization.dart';
import 'package:etoile_app/constance/app_styles.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/constance/translation_constance.dart';
import 'package:etoile_app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constance/colors.dart';
import '../../../../core/helper/methods/add_product_to_basket.dart';

class ProductItemForListView extends StatelessWidget {
  const ProductItemForListView({super.key, required this.product});

  final Products product;

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productDetailsScreen,
            arguments: product.productId);
      },
      child: Card(
        elevation: 2.2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.buttonColor,
                foregroundColor: AppColors.buttonColor,
                radius: 9,
                child: InkWell(
                  onTap: () {
                    addProductToBasket(context, quantity, product);
                  },
                  child: const Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                  flex: 1,
                  child: Image.network(
                    product.image,
                  )),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 14.sp,
                        fontFamily: AppStyles.almaraiFontFamily,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      '${product.price} ${TranslationConstance.currency.tr()}',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.lightBlack,
                        fontFamily: AppStyles.almaraiFontFamily,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
